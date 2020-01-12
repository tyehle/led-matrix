#include <SPI.h>

int dataPin = 11;  // MOSI
int clockPin = 13; // SCK
int regPin = 10;
int outputDisable = 3;

unsigned short out; // 16 bits

const bool spi = true;

void setup() {
  if(spi) {
    SPI.begin();
    SPI.beginTransaction(SPISettings(24000000, MSBFIRST, SPI_MODE0));
  } else {
    pinMode(dataPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
  }

  pinMode(regPin, OUTPUT);
  pinMode(outputDisable, OUTPUT);
  digitalWrite(outputDisable, LOW);
  
  out = 1;

  pinMode(6, OUTPUT);
  digitalWrite(6, HIGH);
}


void loop() {
  if(spi) {
    SPI.transfer((out >> 8) ^ -1);
    SPI.transfer(out ^ -1);
  } else {
    digitalWrite(clockPin, LOW);
    shiftOut(dataPin, clockPin, MSBFIRST, out);
  }

  digitalWrite(regPin, HIGH);
  digitalWrite(regPin, LOW);

  out += 1;

  
//  long start = micros();
//  while(micros() < start + 100000) {}
//  delay(250);
}
