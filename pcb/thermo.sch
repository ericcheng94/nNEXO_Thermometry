EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x08 MAX31865_1
U 1 1 610B2393
P 2800 6600
F 0 "MAX31865_1" H 2850 6100 50  0000 R CNN
F 1 "Conn_01x08" H 2850 7000 50  0000 R CNN
F 2 "" H 2800 6600 50  0001 C CNN
F 3 "~" H 2800 6600 50  0001 C CNN
	1    2800 6600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 MAX31865_2
U 1 1 610C5B26
P 2800 5500
F 0 "MAX31865_2" H 2850 5000 50  0000 R CNN
F 1 "Conn_01x08" H 2850 5900 50  0000 R CNN
F 2 "" H 2800 5500 50  0001 C CNN
F 3 "~" H 2800 5500 50  0001 C CNN
	1    2800 5500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 MAX31865_3
U 1 1 610CD50A
P 2800 4400
F 0 "MAX31865_3" H 2850 3900 50  0000 R CNN
F 1 "Conn_01x08" H 2850 4800 50  0000 R CNN
F 2 "" H 2800 4400 50  0001 C CNN
F 3 "~" H 2800 4400 50  0001 C CNN
	1    2800 4400
	-1   0    0    1   
$EndComp
$Comp
L teensy:Teensy4.1 MCU1
U 1 1 610D658F
P 5700 4400
F 0 "MCU1" H 5700 6965 50  0000 C CNN
F 1 "Teensy4.1" H 5700 6874 50  0000 C CNN
F 2 "" H 5300 4800 50  0001 C CNN
F 3 "" H 5300 4800 50  0001 C CNN
	1    5700 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x09 MAX31856_2
U 1 1 61103632
P 6150 6750
F 0 "MAX31856_2" V 6275 6746 50  0000 C CNN
F 1 "Conn_01x09" V 6366 6746 50  0000 C CNN
F 2 "" H 6150 6750 50  0001 C CNN
F 3 "~" H 6150 6750 50  0001 C CNN
	1    6150 6750
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 MAX31865_4
U 1 1 610CEBC7
P 2800 3300
F 0 "MAX31865_4" H 2850 2800 50  0000 R CNN
F 1 "Conn_01x08" H 2850 3700 50  0000 R CNN
F 2 "" H 2800 3300 50  0001 C CNN
F 3 "~" H 2800 3300 50  0001 C CNN
	1    2800 3300
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x09 MAX31856_1
U 1 1 610FE9A6
P 4850 6750
F 0 "MAX31856_1" V 4975 6746 50  0000 C CNN
F 1 "Conn_01x09" V 5066 6746 50  0000 C CNN
F 2 "" H 4850 6750 50  0001 C CNN
F 3 "~" H 4850 6750 50  0001 C CNN
	1    4850 6750
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x14 ILI9341TFT1
U 1 1 6110AE8C
P 8350 2450
F 0 "ILI9341TFT1" H 8500 3150 50  0000 C CNN
F 1 "Conn_01x14" H 8500 1650 50  0000 C CNN
F 2 "" H 8350 2450 50  0001 C CNN
F 3 "~" H 8350 2450 50  0001 C CNN
	1    8350 2450
	1    0    0    -1  
$EndComp
Entry Wire Line
	3550 2200 3650 2300
Entry Wire Line
	3550 2100 3650 2200
Entry Wire Line
	3550 2000 3650 2100
Entry Wire Line
	3550 1900 3650 2000
Entry Wire Line
	3550 6600 3650 6700
Entry Wire Line
	3550 6500 3650 6600
Entry Wire Line
	3550 6400 3650 6500
Entry Wire Line
	3550 6300 3650 6400
Entry Wire Line
	3550 5500 3650 5600
Entry Wire Line
	3550 5400 3650 5500
Entry Wire Line
	3550 5300 3650 5400
Entry Wire Line
	3550 5200 3650 5300
Entry Wire Line
	3550 4400 3650 4500
Entry Wire Line
	3550 4300 3650 4400
Entry Wire Line
	3550 4200 3650 4300
Entry Wire Line
	3550 4100 3650 4200
Entry Wire Line
	3550 3000 3650 3100
Entry Wire Line
	3550 3100 3650 3200
Entry Wire Line
	3550 3200 3650 3300
Entry Wire Line
	3550 3300 3650 3400
Wire Wire Line
	3000 2900 3550 2900
Wire Wire Line
	3000 3000 3550 3000
Wire Wire Line
	3550 3100 3000 3100
Wire Wire Line
	3000 3200 3550 3200
Wire Wire Line
	3550 3300 3000 3300
Wire Wire Line
	3000 3400 3550 3400
Wire Wire Line
	3000 4000 3550 4000
Wire Wire Line
	3550 4100 3000 4100
Wire Wire Line
	3000 4200 3550 4200
Wire Wire Line
	3550 4300 3000 4300
Wire Wire Line
	3000 4400 3550 4400
Wire Wire Line
	3000 4500 3550 4500
Wire Wire Line
	3000 5600 3550 5600
Wire Wire Line
	3550 5500 3000 5500
Wire Wire Line
	3000 5400 3550 5400
Wire Wire Line
	3550 5300 3000 5300
Wire Wire Line
	3000 5200 3550 5200
Wire Wire Line
	3550 5100 3000 5100
Wire Wire Line
	3550 6200 3000 6200
Wire Wire Line
	3000 6300 3550 6300
Wire Wire Line
	3550 6400 3000 6400
Wire Wire Line
	3000 6500 3550 6500
Wire Wire Line
	3550 6600 3000 6600
Wire Wire Line
	3000 6700 3550 6700
Entry Wire Line
	4650 6050 4750 6150
Entry Wire Line
	4750 6050 4850 6150
Entry Wire Line
	4850 6050 4950 6150
Entry Wire Line
	4950 6050 5050 6150
Entry Wire Line
	5950 6050 6050 6150
Entry Wire Line
	6050 6050 6150 6150
Entry Wire Line
	6150 6050 6250 6150
Entry Wire Line
	6250 6050 6350 6150
Text Label 3400 1800 0    50   Italic 0
RDY
Wire Wire Line
	3550 2300 3000 2300
Wire Wire Line
	3000 2200 3550 2200
Wire Wire Line
	3550 2100 3000 2100
Wire Wire Line
	3000 2000 3550 2000
Wire Wire Line
	3550 1900 3000 1900
Wire Wire Line
	3000 1800 3550 1800
$Comp
L Connector_Generic:Conn_01x08 MAX31865_5
U 1 1 610CB92E
P 2800 2200
F 0 "MAX31865_5" H 2850 1700 50  0000 R CNN
F 1 "Conn_01x08" H 2850 2600 50  0000 R CNN
F 2 "" H 2800 2200 50  0001 C CNN
F 3 "~" H 2800 2200 50  0001 C CNN
	1    2800 2200
	-1   0    0    1   
$EndComp
Text Label 3400 2900 0    50   Italic 0
RDY
Text Label 3400 4000 0    50   Italic 0
RDY
Text Label 3400 5100 0    50   Italic 0
RDY
Text Label 3400 6200 0    50   Italic 0
RDY
Text Label 3350 1900 0    50   ~ 0
CS_5
Text Label 3400 2000 0    50   ~ 0
SDI
Text Label 3400 2100 0    50   ~ 0
SDO
Text Label 3400 2200 0    50   ~ 0
CLK
Text Label 3250 2300 0    50   Italic 0
3V3_out
Text Label 3400 2400 0    50   ~ 0
GND
Text Label 3400 2500 0    50   ~ 0
VIN
Text Label 3400 3100 0    50   ~ 0
SDI
Text Label 3400 4200 0    50   ~ 0
SDI
Text Label 3400 5300 0    50   ~ 0
SDI
Text Label 3400 6400 0    50   ~ 0
SDI
Text Label 3400 3200 0    50   ~ 0
SDO
Text Label 3400 4300 0    50   ~ 0
SDO
Text Label 3400 5400 0    50   ~ 0
SDO
Text Label 3400 6500 0    50   ~ 0
SDO
Text Label 3400 3300 0    50   ~ 0
CLK
Text Label 3400 3500 0    50   ~ 0
GND
Text Label 3400 3600 0    50   ~ 0
VIN
Text Label 3400 6900 0    50   ~ 0
VIN
Text Label 3400 5800 0    50   ~ 0
VIN
Text Label 3400 4700 0    50   ~ 0
VIN
Text Label 3400 4600 0    50   ~ 0
GND
Text Label 3400 5700 0    50   ~ 0
GND
Text Label 3400 6800 0    50   ~ 0
GND
Text Label 3400 4400 0    50   ~ 0
CLK
Text Label 3400 5500 0    50   ~ 0
CLK
Text Label 3400 6600 0    50   ~ 0
CLK
Text Label 3350 3000 0    50   ~ 0
CS_4
Text Label 3350 4100 0    50   ~ 0
CS_3
Text Label 3350 5200 0    50   ~ 0
CS_2
Text Label 3350 6300 0    50   ~ 0
CS_1
Entry Wire Line
	4100 3450 4200 3550
Entry Wire Line
	4100 3350 4200 3450
Text Label 4200 3450 0    50   ~ 0
SDI
Text Label 4200 3550 0    50   ~ 0
SDO
Wire Wire Line
	4200 3450 4600 3450
Wire Wire Line
	4200 3550 4600 3550
Entry Wire Line
	7150 3550 7250 3650
Wire Wire Line
	7150 3550 6800 3550
Text Label 7000 3550 0    50   ~ 0
CLK
Text Label 7000 2350 0    50   ~ 0
GND
Text Label 3250 3400 0    50   Italic 0
3V3_out
Text Label 3250 4500 0    50   Italic 0
3V3_out
Text Label 3250 5600 0    50   Italic 0
3V3_out
Text Label 3250 6700 0    50   Italic 0
3V3_out
Text Label 7000 2450 0    50   ~ 0
VIN
Entry Wire Line
	7650 1750 7750 1850
Entry Wire Line
	7650 1950 7750 2050
Entry Wire Line
	7650 2050 7750 2150
Entry Wire Line
	7650 2150 7750 2250
Entry Wire Line
	7650 2250 7750 2350
Entry Wire Line
	7650 2350 7750 2450
Entry Wire Line
	7650 2450 7750 2550
Entry Wire Line
	7650 2550 7750 2650
Entry Wire Line
	7650 2650 7750 2750
Entry Wire Line
	7650 2750 7750 2850
Entry Wire Line
	7650 2850 7750 2950
Entry Wire Line
	7650 2950 7750 3050
Entry Wire Line
	7650 3050 7750 3150
Wire Wire Line
	7750 1850 8150 1850
Wire Wire Line
	8150 2050 7750 2050
Wire Wire Line
	7750 2150 8150 2150
Wire Wire Line
	8150 2250 7750 2250
Wire Wire Line
	7750 2350 8150 2350
Wire Wire Line
	8150 2450 7750 2450
Wire Wire Line
	7750 2550 8150 2550
Wire Wire Line
	8150 2650 7750 2650
Wire Wire Line
	8150 2750 7750 2750
Wire Wire Line
	7750 2850 8150 2850
Wire Wire Line
	8150 2950 7750 2950
Wire Wire Line
	7750 3050 8150 3050
Wire Wire Line
	8150 3150 7750 3150
Text Label 7750 1850 0    50   ~ 0
VIN
Text Label 7750 2550 0    50   ~ 0
VIN
Entry Wire Line
	7150 2250 7250 2350
Wire Wire Line
	6800 2250 7150 2250
Text Label 6900 2250 0    50   ~ 0
VIN_TFT
Text Label 7750 1950 0    50   ~ 0
GND
Entry Wire Line
	4100 3250 4200 3350
Wire Wire Line
	4200 3350 4600 3350
Text Label 4200 3350 0    50   ~ 0
CS_1
Entry Wire Line
	4100 3150 4200 3250
Entry Wire Line
	4100 3050 4200 3150
Entry Wire Line
	4100 2950 4200 3050
Entry Wire Line
	4100 2850 4200 2950
Entry Wire Line
	4100 2750 4200 2850
Wire Wire Line
	4200 2850 4600 2850
Wire Wire Line
	4600 2950 4200 2950
Wire Wire Line
	4200 3050 4600 3050
Wire Wire Line
	4600 3150 4200 3150
Wire Wire Line
	4200 3250 4600 3250
Text Label 4200 3250 0    50   ~ 0
TFT_DC
Text Label 4200 2850 0    50   ~ 0
CS_2
Text Label 4200 2950 0    50   ~ 0
CS_3
Text Label 4200 3050 0    50   ~ 0
CS_4
Text Label 4200 3150 0    50   ~ 0
CS_5
Entry Wire Line
	7150 4150 7250 4250
Entry Wire Line
	7150 4250 7250 4350
Wire Wire Line
	6800 4150 7150 4150
Wire Wire Line
	7150 4250 6800 4250
Text Label 6950 4150 0    50   ~ 0
CS_7
Text Label 6950 4250 0    50   ~ 0
CS_6
Entry Wire Line
	7150 4350 7250 4450
Wire Wire Line
	7150 4350 6800 4350
Text Label 6900 4350 0    50   ~ 0
TFT_CS
Wire Bus Line
	3650 1650 4100 1650
Connection ~ 3650 6050
Connection ~ 4100 1650
Connection ~ 7250 1650
Wire Bus Line
	5850 1650 7250 1650
Wire Bus Line
	4100 1650 7250 1650
Wire Bus Line
	7250 1650 7650 1650
Text Label 7750 2050 0    50   ~ 0
TFT_CS
Text Label 7750 2150 0    50   ~ 0
VIN
Text Label 7750 2250 0    50   ~ 0
TFT_DC
Text Label 7750 2350 0    50   ~ 0
SDI
Text Label 7750 2450 0    50   ~ 0
CLK
Text Label 7750 2650 0    50   ~ 0
SDO
Text Label 7750 2750 0    50   Italic 0
T_CLK
Text Label 7750 2850 0    50   Italic 0
T_CS
Text Label 7750 2950 0    50   Italic 0
T_DIN
Text Label 7750 3050 0    50   Italic 0
T_DO
Text Label 7750 3150 0    50   Italic 0
T_IRQ
Text Label 4550 6500 1    50   Italic 0
3V3_out
Wire Wire Line
	6550 6150 6550 6550
Wire Wire Line
	6450 6150 6450 6550
Wire Wire Line
	6350 6150 6350 6550
Wire Wire Line
	6250 6150 6250 6550
Wire Wire Line
	6150 6150 6150 6550
Wire Wire Line
	4550 6150 4550 6550
Wire Wire Line
	4750 6150 4750 6550
Wire Wire Line
	4850 6150 4850 6550
Wire Wire Line
	4950 6150 4950 6550
Wire Wire Line
	5050 6150 5050 6550
Wire Wire Line
	5150 6150 5150 6550
Wire Wire Line
	5250 6150 5250 6550
Wire Wire Line
	5850 6150 5850 6550
Wire Wire Line
	6050 6150 6050 6550
Text Label 5850 6500 1    50   Italic 0
3V3_out
Text Label 5750 6350 1    50   ~ 0
VIN
Text Label 4650 6350 1    50   ~ 0
GND
Text Label 4450 6350 1    50   ~ 0
VIN
Text Label 5950 6350 1    50   ~ 0
GND
Text Label 4750 6350 1    50   ~ 0
CLK
Text Label 4850 6350 1    50   ~ 0
SDO
Text Label 6250 6350 1    50   ~ 0
SDI
Text Label 6350 6350 1    50   ~ 0
CS_7
Text Label 6450 6350 1    50   Italic 0
FLT
Text Label 5250 6350 1    50   Italic 0
DRDY
Text Label 6550 6350 1    50   Italic 0
DRDY
Text Label 5150 6350 1    50   Italic 0
FLT
Text Label 5050 6350 1    50   ~ 0
CS_6
Text Label 4950 6350 1    50   ~ 0
SDI
Text Label 6150 6350 1    50   ~ 0
SDO
Text Label 6050 6350 1    50   ~ 0
CLK
Wire Wire Line
	3850 2400 3850 3500
Connection ~ 3850 3500
Connection ~ 3850 4600
Wire Wire Line
	3850 4600 3850 3500
Connection ~ 3850 5700
Wire Wire Line
	3850 5700 3850 4600
Connection ~ 3850 6800
Wire Wire Line
	3850 6800 3850 7100
$Comp
L power:GND #PWR01
U 1 1 61101346
P 3850 7100
F 0 "#PWR01" H 3850 6850 50  0001 C CNN
F 1 "GND" H 3855 6927 50  0000 C CNN
F 2 "" H 3850 7100 50  0001 C CNN
F 3 "" H 3850 7100 50  0001 C CNN
	1    3850 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 61101E9E
P 7450 4700
F 0 "#PWR04" H 7450 4450 50  0001 C CNN
F 1 "GND" H 7455 4527 50  0000 C CNN
F 2 "" H 7450 4700 50  0001 C CNN
F 3 "" H 7450 4700 50  0001 C CNN
	1    7450 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1950 7450 2350
Connection ~ 7450 2350
Wire Wire Line
	7450 2350 7450 4700
Wire Wire Line
	4000 6900 4000 5800
Wire Wire Line
	3000 6900 4000 6900
Wire Wire Line
	3000 2500 4000 2500
$Comp
L power:+3.3V #PWR02
U 1 1 6110DF41
P 4000 1350
F 0 "#PWR02" H 4000 1200 50  0001 C CNN
F 1 "+3.3V" H 4015 1523 50  0000 C CNN
F 2 "" H 4000 1350 50  0001 C CNN
F 3 "" H 4000 1350 50  0001 C CNN
	1    4000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1350 4000 2500
Connection ~ 4000 2500
Wire Wire Line
	3000 3600 4000 3600
Connection ~ 4000 3600
Wire Wire Line
	4000 3600 4000 2500
Wire Wire Line
	3000 4700 4000 4700
Connection ~ 4000 4700
Wire Wire Line
	4000 4700 4000 3600
Wire Wire Line
	3000 5800 4000 5800
Connection ~ 4000 5800
Wire Wire Line
	4000 5800 4000 4700
Wire Wire Line
	3850 5950 4650 5950
Connection ~ 3850 5950
Wire Wire Line
	3850 5950 3850 6800
Connection ~ 4650 5950
Wire Wire Line
	5950 5950 4650 5950
Wire Wire Line
	3850 5700 3850 5950
Wire Wire Line
	4000 5800 4450 5800
Wire Wire Line
	4450 5800 5750 5800
Connection ~ 4450 5800
$Comp
L power:+3.3V #PWR03
U 1 1 611331CC
P 7350 1350
F 0 "#PWR03" H 7350 1200 50  0001 C CNN
F 1 "+3.3V" H 7365 1523 50  0000 C CNN
F 2 "" H 7350 1350 50  0001 C CNN
F 3 "" H 7350 1350 50  0001 C CNN
	1    7350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2450 7350 1350
Wire Wire Line
	6800 2450 7350 2450
$Comp
L Connector:Barrel_Jack J2
U 1 1 611393FD
P 5450 1150
F 0 "J2" H 5507 1475 50  0000 C CNN
F 1 "Barrel_Jack" H 5507 1384 50  0000 C CNN
F 2 "" H 5500 1110 50  0001 C CNN
F 3 "~" H 5500 1110 50  0001 C CNN
	1    5450 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB15_Female J1
U 1 1 6113C1DB
P 1400 4250
F 0 "J1" H 1250 3350 50  0000 L CNN
F 1 "DB15_Female" H 1250 5150 50  0000 L CNN
F 2 "" H 1400 4250 50  0001 C CNN
F 3 " ~" H 1400 4250 50  0001 C CNN
	1    1400 4250
	-1   0    0    1   
$EndComp
$Sheet
S -2950 3250 1900 1700
U 6117F0B2
F0 "ADC1" 50
F1 "MAX31865.sch" 50
$EndSheet
$Comp
L Connector_Generic:Conn_01x04 Terminal2
U 1 1 6119A9E7
P 2550 5400
F 0 "Terminal2" H 2450 5600 50  0000 C CNN
F 1 "Conn_01x04" H 2400 5100 50  0000 C CNN
F 2 "" H 2550 5400 50  0001 C CNN
F 3 "~" H 2550 5400 50  0001 C CNN
	1    2550 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 Terminal3
U 1 1 611B0467
P 2550 4300
F 0 "Terminal3" H 2450 4500 50  0000 C CNN
F 1 "Conn_01x04" H 2400 4000 50  0000 C CNN
F 2 "" H 2550 4300 50  0001 C CNN
F 3 "~" H 2550 4300 50  0001 C CNN
	1    2550 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 Terminal4
U 1 1 611B1620
P 2550 3200
F 0 "Terminal4" H 2450 3400 50  0000 C CNN
F 1 "Conn_01x04" H 2400 2900 50  0000 C CNN
F 2 "" H 2550 3200 50  0001 C CNN
F 3 "~" H 2550 3200 50  0001 C CNN
	1    2550 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 Terminal5
U 1 1 611B279C
P 2550 2100
F 0 "Terminal5" H 2450 2300 50  0000 C CNN
F 1 "Conn_01x04" H 2400 1800 50  0000 C CNN
F 2 "" H 2550 2100 50  0001 C CNN
F 3 "~" H 2550 2100 50  0001 C CNN
	1    2550 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2000 1800 2000
Wire Wire Line
	1800 2000 1800 3550
Wire Wire Line
	1800 3550 1700 3550
Wire Wire Line
	2350 2100 1850 2100
Wire Wire Line
	1850 2100 1850 3650
Wire Wire Line
	1850 3650 1700 3650
Wire Wire Line
	2350 2300 1900 2300
Wire Wire Line
	1900 2300 1900 3750
Wire Wire Line
	1900 3750 1700 3750
Wire Wire Line
	2350 3100 1950 3100
Wire Wire Line
	1950 3100 1950 3850
Wire Wire Line
	1950 3850 1700 3850
Wire Wire Line
	2350 3200 2000 3200
Wire Wire Line
	2000 3200 2000 3950
Wire Wire Line
	2000 3950 1700 3950
Wire Wire Line
	2350 3400 2050 3400
Wire Wire Line
	2050 3400 2050 4050
Wire Wire Line
	2050 4050 1700 4050
Wire Wire Line
	1700 4150 2250 4150
Wire Wire Line
	2250 4150 2250 4200
Wire Wire Line
	2250 4200 2350 4200
Wire Wire Line
	1700 4250 2200 4250
Wire Wire Line
	2200 4250 2200 4300
Wire Wire Line
	2200 4300 2350 4300
Wire Wire Line
	2200 4350 2200 4500
Wire Wire Line
	2200 4500 2350 4500
Wire Wire Line
	1700 4350 2200 4350
Wire Wire Line
	1700 4450 2050 4450
Wire Wire Line
	2050 4450 2050 5300
Wire Wire Line
	2050 5300 2350 5300
$Comp
L Connector_Generic:Conn_01x04 Terminal1
U 1 1 611B373F
P 2550 6500
F 0 "Terminal1" H 2450 6700 50  0000 C CNN
F 1 "Conn_01x04" H 2400 6200 50  0000 C CNN
F 2 "" H 2550 6500 50  0001 C CNN
F 3 "~" H 2550 6500 50  0001 C CNN
	1    2550 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6700 1800 6700
Wire Wire Line
	1800 6700 1800 4950
Wire Wire Line
	1800 4950 1700 4950
Wire Wire Line
	2350 6500 1850 6500
Wire Wire Line
	1850 6500 1850 4850
Wire Wire Line
	1850 4850 1700 4850
Wire Wire Line
	2350 6400 1900 6400
Wire Wire Line
	1900 6400 1900 4750
Wire Wire Line
	1900 4750 1700 4750
Wire Wire Line
	2350 5600 1950 5600
Wire Wire Line
	1950 5600 1950 4650
Wire Wire Line
	1950 4650 1700 4650
Wire Wire Line
	2350 5400 2000 5400
Wire Wire Line
	2000 5400 2000 4550
Wire Wire Line
	2000 4550 1700 4550
$Comp
L Connector_Generic:Conn_01x02 tc_flat_connector1
U 1 1 61245535
P 4800 7300
F 0 "tc_flat_connector1" V 5000 7550 50  0000 R CNN
F 1 "Conn_01x02" V 4900 7450 50  0000 R CNN
F 2 "" H 4800 7300 50  0001 C CNN
F 3 "~" H 4800 7300 50  0001 C CNN
	1    4800 7300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 tc_flat_connector2
U 1 1 61247BB6
P 6100 7300
F 0 "tc_flat_connector2" V 6300 7550 50  0000 R CNN
F 1 "Conn_01x02" V 6200 7450 50  0000 R CNN
F 2 "" H 6100 7300 50  0001 C CNN
F 3 "~" H 6100 7300 50  0001 C CNN
	1    6100 7300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6800 2350 7450 2350
Wire Wire Line
	7450 1950 8150 1950
Wire Wire Line
	5950 5950 5950 6550
Wire Wire Line
	5750 5800 5750 6550
Wire Wire Line
	4650 5950 4650 6550
Wire Wire Line
	4450 5800 4450 6550
Wire Wire Line
	3000 3500 3850 3500
Wire Wire Line
	3000 4600 3850 4600
Wire Wire Line
	3000 5700 3850 5700
Wire Wire Line
	3000 6800 3850 6800
Wire Wire Line
	3000 2400 3850 2400
Wire Bus Line
	7250 1650 7250 4450
Wire Bus Line
	3650 6050 3650 7000
Wire Bus Line
	4100 1650 4100 3450
Wire Bus Line
	3650 6050 6450 6050
Wire Bus Line
	7650 1650 7650 3050
Wire Bus Line
	3650 1650 3650 6050
$EndSCHEMATC
