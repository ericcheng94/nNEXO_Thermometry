#include <Adafruit_MAX31865.h>
#include <Adafruit_MAX31856.h>
#include <Wire.h>
#include <SPI.h>
#include <NativeEthernet.h>
#include <Arduino.h>
#include <ArduinoRS485.h> // ArduinoModbus depends on the ArduinoRS485 library
#include <ArduinoModbus.h>

#define PIN_CS 37
const byte charTable[10] = {
    B01111110, B00110000, B01101101, B01111001, B00110011, B01011011, B01011111, B01110000, B01111111, B01111011};
const byte ledSeg[8] = {
    B00001000, B00000111, B00000110, B00000101, B00000100, B00000011, B00000010, B00000001 
};
const String sensorArray[7] = {"rtd1", "rtd2", "rtd3", "rtd4", "rtd5", "tcp1", "tcp2"};
#define DECODEMODE_ADDR (0x09)
#define BRIGHTNESS_ADDR (0x0A)
#define SCANLIMIT_ADDR (0x0B)
#define SHUTDOWN_ADDR (0X0C)
#define DISPLAYTEST_ADDR (0x0F)
#define OP_OFF (0x0)
#define OP_ON (0x1)
#define BTN_1 36 // Display Push button 1
#define BTN_2 35 // Display Push button 2

Adafruit_MAX31865 rtd01 = Adafruit_MAX31865(10);
Adafruit_MAX31865 rtd02 = Adafruit_MAX31865(9);
// Adafruit_MAX31865 rtd03 = Adafruit_MAX31865(47);
// Adafruit_MAX31865 rtd04 = Adafruit_MAX31865(45);
// Adafruit_MAX31865 rtd05 = Adafruit_MAX31865(43);

// Thermocouple ADC
Adafruit_MAX31856 tcp01 = Adafruit_MAX31856(8);
// Adafruit_MAX31856 tcp02 = Adafruit_MAX31856(39);

// The value of the Rref resistor. Use 430.0 for PT100 and 4300.0 for PT1000
#define RREF      430.0
// The 'nominal' 0-degrees-C resistance of the sensor
// 100.0 for PT100, 1000.0 for PT1000
#define RNOMINAL  100.0

// Enter a MAC address for your controller below.
byte mac[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
// The IP address will be dependent on your local network:
IPAddress ip(192, 168, 0, 242);

EthernetServer ethServer(502);
ModbusTCPServer modbusTCPServer;

uint32_t currentMillis;
uint32_t pollModbusMillis;
uint32_t updateSensorsMillis;
uint32_t updateClientMillis;
uint32_t updateSerialMillis;
uint32_t updateDisplayMillis;
//uint32_t display1Millis;
//uint32_t display2Millis;
unsigned int  heartbeat;
int           sensorCounter1 = 0; // okay to initialize like this?
int           sensorCounter2 = 0;

// Global variables to make current sensor temps available to every function
float rtd01temp;
float rtd02temp;
float rtd03temp;
float rtd04temp;
float rtd05temp;
float tcp01temp;
float tcp02temp;

//Modbus holding register address mapping
const int rtd01_reg = 0x00;
const int rtd02_reg = 0x01;
const int rtd03_reg = 0x02;
const int rtd04_reg = 0x03;
const int rtd05_reg = 0x04;
const int tcp01_reg1 = 0x05;
const int tcp01_reg2 = 0x06;
const int tcp02_reg1 = 0x07;
const int tcp02_reg2 = 0x08;
const int tick_tock = 0x09;

// const int ledPin = LED_BUILTIN;

void setup() {
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  Serial.println("nEXO ModbusTCP RTDTest!");
  rtd01.begin(MAX31865_3WIRE);  // set to 2WIRE or 4WIRE as necessary
  rtd02.begin(MAX31865_3WIRE);  // set to 2WIRE or 4WIRE as necessary
  tcp01.begin();
//  Serial.print("TC Type: "); Serial.println(tcp01.getThermocoupleType());
  tcp01.setThermocoupleType(MAX31856_TCTYPE_T);

  Ethernet.begin(mac, ip);

  // Check for Ethernet hardware present
  if (Ethernet.hardwareStatus() == EthernetNoHardware) {
    Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
    while (true) {
      delay(1); // do nothing, no point running without Ethernet hardware
    }
  }
  // Keeps displaying error despite having thernet connection, commented out for now
  // if (Ethernet.linkStatus() == LinkOFF) {
  //   Serial.println("Ethernet cable is not connected.");
  // }

  // start the server
  ethServer.begin();

  // start the Modbus TCP server
  if (!modbusTCPServer.begin()) {
    Serial.println("Failed to start Modbus TCP Server!");
    while (1);
  }

  // configure 7 holding registers at address 0x00
  modbusTCPServer.configureHoldingRegisters(0x00, 10);

  pinMode(PIN_CS, OUTPUT);
  pinMode(BTN_1, INPUT);
  pinMode(BTN_2, INPUT);
  digitalWrite(PIN_CS, HIGH);
  SPI.begin(); 
//  SPI.beginTransaction(SPISettings(SPIMAXSPEED, MSBFIRST, SPI_MODE0));  
  spiWrite(DISPLAYTEST_ADDR, OP_OFF);
  //we go into shutdown-mode on startup
  spiWrite(SHUTDOWN_ADDR, OP_OFF);
  //scanlimit is set to max on startup
  spiWrite(SCANLIMIT_ADDR, 7); // show 8 digits
  //decode is done in raw mode
  spiWrite(DECODEMODE_ADDR, 0);
  //clearSegments
  spiWrite(SHUTDOWN_ADDR,OP_ON);
  // set brightness
  spiWrite(BRIGHTNESS_ADDR, 5);
}

void loop() {
  EthernetClient client = ethServer.available();

  // listen for incoming clients
  if (client) {
     Serial.println("new client");
     modbusTCPServer.accept(client);
  
     while (client.connected()) {
       currentMillis = millis();
        
       if (currentMillis - pollModbusMillis > 1000) {
         // poll for Modbus TCP requests, while client connected
         modbusTCPServer.poll();
         pollModbusMillis = currentMillis;
  
//         if (heartbeat > 65000) {
//           heartbeat = 1;
//         } else if (heartbeat % 2 == 1) {
//           modbusTCPServer.holdingRegisterWrite(tick_tock, 1);
//           heartbeat = 0;
//         } else {
//           modbusTCPServer.holdingRegisterWrite(tick_tock, 0);
//           heartbeat = 1;
//         }
       }     

       if (currentMillis - updateSensorsMillis > 100) {
         rtd01temp = rtd01.temperature(RNOMINAL, RREF);
         rtd02temp = rtd02.temperature(RNOMINAL, RREF);
//         rtd03temp = rtd03.temperature(RNOMINAL, RREF);
//         rtd04temp = rtd04.temperature(RNOMINAL, RREF);
//         rtd05temp = rtd05.temperature(RNOMINAL, RREF);
         tcp01temp = tcp01.readThermocoupleTemperature();         
//         tcp02temp = tcp02.readThermocoupleTemperature();         
         updateSensorsMillis = currentMillis;
       }
       
       if (currentMillis - updateClientMillis > 1000) {
         updateClient(tcp01temp);
//         updateClient(tcp01temp, tcp02temp);
         updateClientMillis = currentMillis;
       }      
        
       if (currentMillis - updateSerialMillis > 1000) {
         updateSerial();
         updateSerialMillis = currentMillis;
       }

//        if (currentMillis - updateDisplayMillis > 1000) {
//          updateDisplay();
//          updateDisplayMillis = currentMillis;
//       if (digitalRead(BTN_1)) {
//          writeV1(555.5);
//       } else {
//          writeV1(99.9);
//       }
//       if (digitalRead(BTN_2)) {
//          selectSensor("rtd");
//       } else {
//          selectSensor("tcp");
//       }
     } 
  }
  // backup for if client disconnects, display still runs
//  rtd01temp = rtd01.temperature(RNOMINAL, RREF);
//  rtd02temp = rtd02.temperature(RNOMINAL, RREF);
//         rtd03temp = rtd03.temperature(RNOMINAL, RREF);
//         rtd04temp = rtd04.temperature(RNOMINAL, RREF);
//         rtd05temp = rtd05.temperature(RNOMINAL, RREF);
//  tcp01temp = tcp01.readThermocoupleTemperature();         
//         tcp02temp = tcp02.readThermocoupleTemperature();   
//  updateDisplay(rtd01temp);
//  updateDisplay(rtd01temp, rtd02temp, tcp01temp);
//  updateDisplay(rtd01temp, rtd02temp, rtd03temp, rtd04temp, rtd05temp, tcp01temp, tcp02temp);
}

union {
    float asFloat;
    uint16_t asInt[2];
} flreg;

void updateClient(float tcp01temp) {
  uint16_t rawRTD01 = rtd01.readRTD();
  uint16_t rawRTD02 = rtd02.readRTD();
  Serial.print("rtd01 raw = "); Serial.println(rawRTD01);
  Serial.print("rtd02 raw = "); Serial.println(rawRTD02);
  Serial.print("tcp temperature = "); Serial.println(tcp01temp);
  modbusTCPServer.holdingRegisterWrite(rtd01_reg, rawRTD01);
  modbusTCPServer.holdingRegisterWrite(rtd02_reg, rawRTD02);

//  uint16_t a[2];
  flreg.asFloat = tcp01temp;
  modbusTCPServer.holdingRegisterWrite(tcp01_reg1, flreg.asInt[1]);
  modbusTCPServer.holdingRegisterWrite(tcp01_reg2, flreg.asInt[0]);
}

void  updateSerial() {
  uint16_t rtd = rtd01.readRTD();
  Serial.print("RTD value: "); Serial.println(rtd);
  float ratio = rtd;
  ratio /= 32768;
  Serial.print("Ratio = "); Serial.println(ratio,8);
  Serial.print("Resistance = "); Serial.println(RREF*ratio,8);
  Serial.print("rtd01 temperature = "); Serial.println(rtd01.temperature(RNOMINAL, RREF));
  Serial.print("rtd02 temperature = "); Serial.println(rtd02.temperature(RNOMINAL, RREF));
  Serial.print("TC Temperature:     "); Serial.println(tcp01.readThermocoupleTemperature());
  Serial.print("TC Cold Junction:   "); Serial.println(tcp01.readCJTemperature());
//  Serial.print("TC Fault: "); Serial.println(tcp01.readFault());
  Serial.println();
}

//void updateDisplay(float rtd01temp, float rtd02temp, float tcp01temp) {
void updateDisplay(float rtd01temp) {
//  clearALL();
//    writeV1(23.4);
  if (digitalRead(BTN_1)) {
    sensorCounter1++;
    if (sensorCounter1 > 6)
      sensorCounter1 = 0;
    selectSensor(sensorArray[sensorCounter1], 0);
    delay(1000); // TODO Remove delay 
  }
//  Serial.print("display temp: "); Serial.println(rtd01temp);
//  writeV1(rtd01temp);
  writeV1(22.9);
//  delay(500);
//  if (digitalRead(BTN_2)) {
//    selectSensor("rtd", 1);
//  } else {
//    selectSensor("tcp", 1);
//  }
}

void writeV1(float val) {
  // if > 999.9 show something else
  // Get 100's place
  int v100 = (int) val / 100;
  int v10  = ((int) val % 100) /10;
  int v1   = ((int) val ) % 10;
  int v01  = ((int) (val*10) ) %10;
  Serial.print(v100);
  Serial.print(v10);
  Serial.print(v1);
  Serial.print(".");
  Serial.println(v01);
  if (v100 == 0){
    spiWrite(ledSeg[0], B00000000);
  }
  else {
    spiWrite(ledSeg[0], charTable[v100]);
  }
  // Write 10s place
  spiWrite(ledSeg[1], charTable[v10]);
  // Write 1s place
  spiWrite(ledSeg[2], B10000000+charTable[v1]);
  // Write 0.1s place
  spiWrite(ledSeg[3], charTable[v01]);
}

void writeV2(float val) {
  // if > 999.9 show something else
  // Get 100's place
  int v100 = (int) val / 100;
  int v10  = ((int) val % 100) /10;
  int v1   = ((int) val ) % 10;
  int v01  = ((int) (val*10) ) %10;
//  Serial.print(v100);
//  Serial.print(v10);
//  Serial.print(v1);
//  Serial.print(".");
//  Serial.println(v01);
  if (v100 == 0){
    spiWrite(ledSeg[4], B00000000);
  }
  else {
    spiWrite(ledSeg[4], charTable[v100]);
  }
  // Write 10s place
  spiWrite(ledSeg[5], charTable[v10]);
  // Write 1s place
  spiWrite(ledSeg[6], B10000000+charTable[v1]);
  // Write 0.1s place
  spiWrite(ledSeg[7], charTable[v01]);
}

// TODO create chartable for sensor name as well to save space
void selectSensor(String sensor, int side) {
  if (side == 0) {
    if (sensor == "rtd1") {
      spiWrite(ledSeg[0], B00000101);
      spiWrite(ledSeg[1], B00001111);
      spiWrite(ledSeg[2], B00111101);
      spiWrite(ledSeg[3], charTable[1]);
    } else if (sensor == "rtd2") {
      spiWrite(ledSeg[0], B00000101);
      spiWrite(ledSeg[1], B00001111);
      spiWrite(ledSeg[2], B00111101);
      spiWrite(ledSeg[3], charTable[2]);      
    } else if (sensor == "rtd3") {
      spiWrite(ledSeg[0], B00000101);
      spiWrite(ledSeg[1], B00001111);
      spiWrite(ledSeg[2], B00111101);
      spiWrite(ledSeg[3], charTable[3]);  
    } else if (sensor == "rtd4") {
      spiWrite(ledSeg[0], B00000101);
      spiWrite(ledSeg[1], B00001111);
      spiWrite(ledSeg[2], B00111101);
      spiWrite(ledSeg[3], charTable[4]);  
    } else if (sensor == "rtd5") {
      spiWrite(ledSeg[0], B00000101);
      spiWrite(ledSeg[1], B00001111);
      spiWrite(ledSeg[2], B00111101);
      spiWrite(ledSeg[3], charTable[5]); 
    } else if (sensor == "tcp1") {
      spiWrite(ledSeg[0], B00001111);
      spiWrite(ledSeg[1], B01001110);
      spiWrite(ledSeg[2], B01100111);
      spiWrite(ledSeg[3], charTable[1]); 
    } else if (sensor == "tcp2") {
      spiWrite(ledSeg[0], B00001111);
      spiWrite(ledSeg[1], B01001110);
      spiWrite(ledSeg[2], B01100111);
      spiWrite(ledSeg[3], charTable[2]);                             
    }
  }
}

void clearALL() {
  spiWrite(ledSeg[0], B00000000);
  spiWrite(ledSeg[1], B00000000);
  spiWrite(ledSeg[2], B00000000);
  spiWrite(ledSeg[3], B00000000);
  spiWrite(ledSeg[4], B00000000);
  spiWrite(ledSeg[5], B00000000);
  spiWrite(ledSeg[6], B00000000);
  spiWrite(ledSeg[7], B00000000);
}

// Taken from Examples->SPI->BarometricPressureSensor
void spiWrite(byte thisRegister, byte thisValue) {
  // SCP1000 expects the register address in the upper 6 bits
  // of the byte. So shift the bits left by two bits:
  //thisRegister = thisRegister << 2;
  // now combine the register address and the command into one byte:
  //byte dataToSend = thisRegister | WRITE;
  // take the chip select low to select the device:
  digitalWrite(PIN_CS, LOW);
  SPI.transfer(thisRegister); //Send register location
  SPI.transfer(thisValue);  //Send value to record into register
  // take the chip select high to de-select:
  digitalWrite(PIN_CS, HIGH);
}

void checkPTFault() {
  // Check and print any faults
  uint8_t fault = rtd01.readFault();
  if (fault) {
    Serial.print("Fault 0x"); Serial.println(fault, HEX);
    if (fault & MAX31865_FAULT_HIGHTHRESH) {
      Serial.println("RTD High Threshold");
    }
    if (fault & MAX31865_FAULT_LOWTHRESH) {
      Serial.println("RTD Low Threshold");
    }
    if (fault & MAX31865_FAULT_REFINLOW) {
      Serial.println("REFIN- > 0.85 x Bias");
    }
    if (fault & MAX31865_FAULT_REFINHIGH) {
      Serial.println("REFIN- < 0.85 x Bias - FORCE- open");
    }
    if (fault & MAX31865_FAULT_RTDINLOW) {
      Serial.println("RTDIN- < 0.85 x Bias - FORCE- open");
    }
    if (fault & MAX31865_FAULT_OVUV) {
      Serial.println("Under/Over voltage");
    }
    rtd01.clearFault();
  }
}
