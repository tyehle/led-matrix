EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:LED D1
U 1 1 5DD575FB
P 4050 2250
F 0 "D1" V 4100 2350 50  0000 L CNN
F 1 "LED" V 4000 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4050 2250 50  0001 C CNN
F 3 "~" H 4050 2250 50  0001 C CNN
	1    4050 2250
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5DD5792E
P 2650 2200
F 0 "J1" H 2570 2517 50  0000 C CNN
F 1 "Conn_01x04" H 2570 2426 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2650 2200 50  0001 C CNN
F 3 "~" H 2650 2200 50  0001 C CNN
	1    2650 2200
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5DD57B07
P 8000 5600
F 0 "J2" V 8124 5546 50  0000 C CNN
F 1 "Conn_01x08" V 8215 5546 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 8000 5600 50  0001 C CNN
F 3 "~" H 8000 5600 50  0001 C CNN
	1    8000 5600
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D5
U 1 1 5DD5818C
P 4650 2250
F 0 "D5" V 4700 2350 50  0000 L CNN
F 1 "LED" V 4600 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4650 2250 50  0001 C CNN
F 3 "~" H 4650 2250 50  0001 C CNN
	1    4650 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 2100 4650 2100
$Comp
L Device:LED D2
U 1 1 5DD5826E
P 4050 2850
F 0 "D2" V 4100 2950 50  0000 L CNN
F 1 "LED" V 4000 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4050 2850 50  0001 C CNN
F 3 "~" H 4050 2850 50  0001 C CNN
	1    4050 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D6
U 1 1 5DD58275
P 4650 2850
F 0 "D6" V 4700 2950 50  0000 L CNN
F 1 "LED" V 4600 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4650 2850 50  0001 C CNN
F 3 "~" H 4650 2850 50  0001 C CNN
	1    4650 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 3000 4050 3100
Wire Wire Line
	4050 3100 4200 3100
Wire Wire Line
	4200 2500 4050 2500
Wire Wire Line
	4050 2500 4050 2400
Wire Wire Line
	4650 2400 4650 2500
Wire Wire Line
	4650 2500 4800 2500
Wire Wire Line
	4800 2500 4800 3100
Wire Wire Line
	4800 3100 4650 3100
Wire Wire Line
	4650 3100 4650 3000
Wire Wire Line
	4200 2500 4200 3100
$Comp
L Device:LED D3
U 1 1 5DD58932
P 4050 3450
F 0 "D3" V 4100 3550 50  0000 L CNN
F 1 "LED" V 4000 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4050 3450 50  0001 C CNN
F 3 "~" H 4050 3450 50  0001 C CNN
	1    4050 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D7
U 1 1 5DD58939
P 4650 3450
F 0 "D7" V 4700 3550 50  0000 L CNN
F 1 "LED" V 4600 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4650 3450 50  0001 C CNN
F 3 "~" H 4650 3450 50  0001 C CNN
	1    4650 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 3300 4650 3300
$Comp
L Device:LED D4
U 1 1 5DD58941
P 4050 4050
F 0 "D4" V 4100 4150 50  0000 L CNN
F 1 "LED" V 4000 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4050 4050 50  0001 C CNN
F 3 "~" H 4050 4050 50  0001 C CNN
	1    4050 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D8
U 1 1 5DD58948
P 4650 4050
F 0 "D8" V 4700 4150 50  0000 L CNN
F 1 "LED" V 4600 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 4650 4050 50  0001 C CNN
F 3 "~" H 4650 4050 50  0001 C CNN
	1    4650 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 4200 4050 4300
Wire Wire Line
	4050 4300 4200 4300
Wire Wire Line
	4200 3700 4050 3700
Wire Wire Line
	4050 3700 4050 3600
Wire Wire Line
	4650 3600 4650 3700
Wire Wire Line
	4650 3700 4800 3700
Wire Wire Line
	4800 3700 4800 4300
Wire Wire Line
	4800 4300 4650 4300
Wire Wire Line
	4650 4300 4650 4200
Wire Wire Line
	4050 3900 4650 3900
Wire Wire Line
	4200 3700 4200 4300
Wire Wire Line
	4200 3100 4200 3700
Connection ~ 4200 3100
Connection ~ 4200 3700
Wire Wire Line
	4800 3100 4800 3700
Connection ~ 4800 3100
Connection ~ 4800 3700
$Comp
L Device:LED D9
U 1 1 5DD591E6
P 5250 2250
F 0 "D9" V 5300 2350 50  0000 L CNN
F 1 "LED" V 5200 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5250 2250 50  0001 C CNN
F 3 "~" H 5250 2250 50  0001 C CNN
	1    5250 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D13
U 1 1 5DD591ED
P 5850 2250
F 0 "D13" V 5900 2350 50  0000 L CNN
F 1 "LED" V 5800 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5850 2250 50  0001 C CNN
F 3 "~" H 5850 2250 50  0001 C CNN
	1    5850 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 2100 5850 2100
$Comp
L Device:LED D10
U 1 1 5DD591F5
P 5250 2850
F 0 "D10" V 5300 2950 50  0000 L CNN
F 1 "LED" V 5200 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5250 2850 50  0001 C CNN
F 3 "~" H 5250 2850 50  0001 C CNN
	1    5250 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D14
U 1 1 5DD591FC
P 5850 2850
F 0 "D14" V 5900 2950 50  0000 L CNN
F 1 "LED" V 5800 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5850 2850 50  0001 C CNN
F 3 "~" H 5850 2850 50  0001 C CNN
	1    5850 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 3000 5250 3100
Wire Wire Line
	5250 3100 5400 3100
Wire Wire Line
	5400 2500 5250 2500
Wire Wire Line
	5250 2500 5250 2400
Wire Wire Line
	5850 2400 5850 2500
Wire Wire Line
	5850 2500 6000 2500
Wire Wire Line
	6000 2500 6000 3100
Wire Wire Line
	6000 3100 5850 3100
Wire Wire Line
	5850 3100 5850 3000
Wire Wire Line
	5250 2700 5850 2700
Wire Wire Line
	5400 2500 5400 3100
$Comp
L Device:LED D11
U 1 1 5DD5920E
P 5250 3450
F 0 "D11" V 5300 3550 50  0000 L CNN
F 1 "LED" V 5200 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5250 3450 50  0001 C CNN
F 3 "~" H 5250 3450 50  0001 C CNN
	1    5250 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D15
U 1 1 5DD59215
P 5850 3450
F 0 "D15" V 5900 3550 50  0000 L CNN
F 1 "LED" V 5800 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5850 3450 50  0001 C CNN
F 3 "~" H 5850 3450 50  0001 C CNN
	1    5850 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 3300 5850 3300
$Comp
L Device:LED D12
U 1 1 5DD5921D
P 5250 4050
F 0 "D12" V 5300 4150 50  0000 L CNN
F 1 "LED" V 5200 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5250 4050 50  0001 C CNN
F 3 "~" H 5250 4050 50  0001 C CNN
	1    5250 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D16
U 1 1 5DD59224
P 5850 4050
F 0 "D16" V 5900 4150 50  0000 L CNN
F 1 "LED" V 5800 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 5850 4050 50  0001 C CNN
F 3 "~" H 5850 4050 50  0001 C CNN
	1    5850 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 4200 5250 4300
Wire Wire Line
	5250 4300 5400 4300
Wire Wire Line
	5400 3700 5250 3700
Wire Wire Line
	5250 3700 5250 3600
Wire Wire Line
	5850 3600 5850 3700
Wire Wire Line
	5850 3700 6000 3700
Wire Wire Line
	6000 3700 6000 4300
Wire Wire Line
	6000 4300 5850 4300
Wire Wire Line
	5850 4300 5850 4200
Wire Wire Line
	5250 3900 5850 3900
Wire Wire Line
	5400 3700 5400 4300
Wire Wire Line
	5400 3100 5400 3700
Connection ~ 5400 3100
Connection ~ 5400 3700
Wire Wire Line
	6000 3100 6000 3700
Connection ~ 6000 3100
Connection ~ 6000 3700
Wire Wire Line
	4650 2100 5250 2100
Connection ~ 4650 2100
Connection ~ 5250 2100
Wire Wire Line
	4650 2700 5250 2700
Connection ~ 4650 2700
Connection ~ 5250 2700
Wire Wire Line
	4650 3300 5250 3300
Connection ~ 4650 3300
Connection ~ 5250 3300
Wire Wire Line
	4650 3900 5250 3900
Connection ~ 4650 3900
Connection ~ 5250 3900
$Comp
L Device:LED D17
U 1 1 5DD5C5A0
P 6450 2250
F 0 "D17" V 6500 2350 50  0000 L CNN
F 1 "LED" V 6400 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 6450 2250 50  0001 C CNN
F 3 "~" H 6450 2250 50  0001 C CNN
	1    6450 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D21
U 1 1 5DD5C5A7
P 7050 2250
F 0 "D21" V 7100 2350 50  0000 L CNN
F 1 "LED" V 7000 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7050 2250 50  0001 C CNN
F 3 "~" H 7050 2250 50  0001 C CNN
	1    7050 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 2100 7050 2100
$Comp
L Device:LED D18
U 1 1 5DD5C5AF
P 6450 2850
F 0 "D18" V 6500 2950 50  0000 L CNN
F 1 "LED" V 6400 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 6450 2850 50  0001 C CNN
F 3 "~" H 6450 2850 50  0001 C CNN
	1    6450 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D22
U 1 1 5DD5C5B6
P 7050 2850
F 0 "D22" V 7100 2950 50  0000 L CNN
F 1 "LED" V 7000 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7050 2850 50  0001 C CNN
F 3 "~" H 7050 2850 50  0001 C CNN
	1    7050 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 3000 6450 3100
Wire Wire Line
	6450 3100 6600 3100
Wire Wire Line
	6600 2500 6450 2500
Wire Wire Line
	6450 2500 6450 2400
Wire Wire Line
	7050 2400 7050 2500
Wire Wire Line
	7050 2500 7200 2500
Wire Wire Line
	7200 2500 7200 3100
Wire Wire Line
	7200 3100 7050 3100
Wire Wire Line
	7050 3100 7050 3000
Wire Wire Line
	6450 2700 7050 2700
Wire Wire Line
	6600 2500 6600 3100
$Comp
L Device:LED D19
U 1 1 5DD5C5C8
P 6450 3450
F 0 "D19" V 6500 3550 50  0000 L CNN
F 1 "LED" V 6400 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 6450 3450 50  0001 C CNN
F 3 "~" H 6450 3450 50  0001 C CNN
	1    6450 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D23
U 1 1 5DD5C5CF
P 7050 3450
F 0 "D23" V 7100 3550 50  0000 L CNN
F 1 "LED" V 7000 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7050 3450 50  0001 C CNN
F 3 "~" H 7050 3450 50  0001 C CNN
	1    7050 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 3300 7050 3300
$Comp
L Device:LED D20
U 1 1 5DD5C5D7
P 6450 4050
F 0 "D20" V 6500 4150 50  0000 L CNN
F 1 "LED" V 6400 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 6450 4050 50  0001 C CNN
F 3 "~" H 6450 4050 50  0001 C CNN
	1    6450 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D24
U 1 1 5DD5C5DE
P 7050 4050
F 0 "D24" V 7100 4150 50  0000 L CNN
F 1 "LED" V 7000 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7050 4050 50  0001 C CNN
F 3 "~" H 7050 4050 50  0001 C CNN
	1    7050 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 4200 6450 4300
Wire Wire Line
	6450 4300 6600 4300
Wire Wire Line
	6600 3700 6450 3700
Wire Wire Line
	6450 3700 6450 3600
Wire Wire Line
	7050 3600 7050 3700
Wire Wire Line
	7050 3700 7200 3700
Wire Wire Line
	7200 3700 7200 4300
Wire Wire Line
	7200 4300 7050 4300
Wire Wire Line
	7050 4300 7050 4200
Wire Wire Line
	6450 3900 7050 3900
Wire Wire Line
	6600 3700 6600 4300
Wire Wire Line
	6600 3100 6600 3700
Connection ~ 6600 3100
Connection ~ 6600 3700
Wire Wire Line
	7200 3100 7200 3700
Connection ~ 7200 3100
Connection ~ 7200 3700
$Comp
L Device:LED D25
U 1 1 5DD5C5F6
P 7650 2250
F 0 "D25" V 7700 2350 50  0000 L CNN
F 1 "LED" V 7600 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7650 2250 50  0001 C CNN
F 3 "~" H 7650 2250 50  0001 C CNN
	1    7650 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D29
U 1 1 5DD5C5FD
P 8250 2250
F 0 "D29" V 8300 2350 50  0000 L CNN
F 1 "LED" V 8200 2350 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 8250 2250 50  0001 C CNN
F 3 "~" H 8250 2250 50  0001 C CNN
	1    8250 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 2100 8250 2100
$Comp
L Device:LED D26
U 1 1 5DD5C605
P 7650 2850
F 0 "D26" V 7700 2950 50  0000 L CNN
F 1 "LED" V 7600 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7650 2850 50  0001 C CNN
F 3 "~" H 7650 2850 50  0001 C CNN
	1    7650 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D30
U 1 1 5DD5C60C
P 8250 2850
F 0 "D30" V 8300 2950 50  0000 L CNN
F 1 "LED" V 8200 2950 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 8250 2850 50  0001 C CNN
F 3 "~" H 8250 2850 50  0001 C CNN
	1    8250 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 3000 7650 3100
Wire Wire Line
	7650 3100 7800 3100
Wire Wire Line
	7800 2500 7650 2500
Wire Wire Line
	7650 2500 7650 2400
Wire Wire Line
	8250 2400 8250 2500
Wire Wire Line
	8250 2500 8400 2500
Wire Wire Line
	8400 2500 8400 3100
Wire Wire Line
	8400 3100 8250 3100
Wire Wire Line
	8250 3100 8250 3000
Wire Wire Line
	7650 2700 8250 2700
Wire Wire Line
	7800 2500 7800 3100
$Comp
L Device:LED D27
U 1 1 5DD5C61E
P 7650 3450
F 0 "D27" V 7700 3550 50  0000 L CNN
F 1 "LED" V 7600 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7650 3450 50  0001 C CNN
F 3 "~" H 7650 3450 50  0001 C CNN
	1    7650 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D31
U 1 1 5DD5C625
P 8250 3450
F 0 "D31" V 8300 3550 50  0000 L CNN
F 1 "LED" V 8200 3550 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 8250 3450 50  0001 C CNN
F 3 "~" H 8250 3450 50  0001 C CNN
	1    8250 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 3300 8250 3300
$Comp
L Device:LED D28
U 1 1 5DD5C62D
P 7650 4050
F 0 "D28" V 7700 4150 50  0000 L CNN
F 1 "LED" V 7600 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 7650 4050 50  0001 C CNN
F 3 "~" H 7650 4050 50  0001 C CNN
	1    7650 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D32
U 1 1 5DD5C634
P 8250 4050
F 0 "D32" V 8300 4150 50  0000 L CNN
F 1 "LED" V 8200 4150 50  0000 L CNN
F 2 "Diode_SMD:D_0805_2012Metric_Castellated" H 8250 4050 50  0001 C CNN
F 3 "~" H 8250 4050 50  0001 C CNN
	1    8250 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 4200 7650 4300
Wire Wire Line
	7650 4300 7800 4300
Wire Wire Line
	7800 3700 7650 3700
Wire Wire Line
	7650 3700 7650 3600
Wire Wire Line
	8250 3600 8250 3700
Wire Wire Line
	8250 3700 8400 3700
Wire Wire Line
	8400 3700 8400 4300
Wire Wire Line
	8400 4300 8250 4300
Wire Wire Line
	8250 4300 8250 4200
Wire Wire Line
	7650 3900 8250 3900
Wire Wire Line
	7800 3700 7800 4300
Wire Wire Line
	7800 3100 7800 3700
Connection ~ 7800 3100
Connection ~ 7800 3700
Wire Wire Line
	8400 3100 8400 3700
Connection ~ 8400 3100
Connection ~ 8400 3700
Wire Wire Line
	7050 2100 7650 2100
Connection ~ 7050 2100
Connection ~ 7650 2100
Wire Wire Line
	7050 2700 7650 2700
Connection ~ 7050 2700
Connection ~ 7650 2700
Wire Wire Line
	7050 3300 7650 3300
Connection ~ 7050 3300
Connection ~ 7650 3300
Wire Wire Line
	7050 3900 7650 3900
Connection ~ 7050 3900
Connection ~ 7650 3900
Wire Wire Line
	5850 3900 6450 3900
Connection ~ 5850 3900
Connection ~ 6450 3900
Wire Wire Line
	5850 3300 6450 3300
Connection ~ 5850 3300
Connection ~ 6450 3300
Wire Wire Line
	5850 2700 6450 2700
Connection ~ 5850 2700
Connection ~ 6450 2700
Wire Wire Line
	5850 2100 6450 2100
Connection ~ 5850 2100
Connection ~ 6450 2100
Wire Wire Line
	8400 4300 8400 5400
Connection ~ 8400 4300
Wire Wire Line
	7700 5400 7700 5300
Wire Wire Line
	7700 5300 4200 5300
Wire Wire Line
	4200 5300 4200 4300
Connection ~ 4200 4300
Wire Wire Line
	4800 4300 4800 5200
Wire Wire Line
	4800 5200 7800 5200
Wire Wire Line
	7800 5200 7800 5400
Connection ~ 4800 4300
Wire Wire Line
	5400 4300 5400 5100
Wire Wire Line
	5400 5100 7900 5100
Wire Wire Line
	7900 5100 7900 5400
Connection ~ 5400 4300
Wire Wire Line
	6000 4300 6000 5000
Wire Wire Line
	6000 5000 8000 5000
Wire Wire Line
	8000 5000 8000 5400
Connection ~ 6000 4300
Wire Wire Line
	6600 4300 6600 4900
Wire Wire Line
	6600 4900 8100 4900
Wire Wire Line
	8100 4900 8100 5400
Connection ~ 6600 4300
Wire Wire Line
	7200 4300 7200 4800
Wire Wire Line
	7200 4800 8200 4800
Wire Wire Line
	8200 4800 8200 5400
Connection ~ 7200 4300
Wire Wire Line
	7800 4300 7800 4700
Wire Wire Line
	7800 4700 8300 4700
Wire Wire Line
	8300 4700 8300 5400
Connection ~ 7800 4300
Wire Wire Line
	2850 2100 4050 2100
Connection ~ 4050 2100
Wire Wire Line
	2850 2400 2950 2400
Wire Wire Line
	2950 2400 2950 3900
Wire Wire Line
	2950 3900 4050 3900
Connection ~ 4050 3900
Wire Wire Line
	4050 3300 3050 3300
Wire Wire Line
	3050 3300 3050 2300
Wire Wire Line
	3050 2300 2850 2300
Connection ~ 4050 3300
Wire Wire Line
	2850 2200 3150 2200
Wire Wire Line
	3150 2200 3150 2700
Wire Wire Line
	3150 2700 4050 2700
Connection ~ 4050 2700
Wire Wire Line
	4050 2700 4650 2700
$EndSCHEMATC
