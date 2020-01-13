#include <SPI.h>
#include "hilbert_curve.h"

int regPin = 10;
int outputDisablePin = 3;

int rows[4] = {6, 7, 8, 9};

char image[8][16] = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};

int animation_fps = 24;
int animation_frame;
long animation_frame_duration;
long animation_frame_start;

unsigned long layer_end_time;

void setup() {
  SPI.begin();
  SPI.beginTransaction(SPISettings(24000000, MSBFIRST, SPI_MODE0));

  pinMode(regPin, OUTPUT);
  digitalWrite(regPin, LOW);

  pinMode(outputDisablePin, OUTPUT);
  digitalWrite(outputDisablePin, LOW);

  for(int i = 0; i < 4; i++) {
    pinMode(rows[i], OUTPUT);
  }

  animation_frame_duration = 1000000 / animation_fps;
  animation_frame = 0;
  step_image(animation_frame, image);
  animation_frame_start = micros();

  layer_end_time = micros() + 10000;
}

void update_frame() {
  if(micros() - animation_frame_start >= animation_frame_duration) {
    animation_frame += 1;
    if(animation_frame >= 128) {
      animation_frame = 0;
    }
    step_image(animation_frame, image);
    animation_frame_start = micros();
  }
}

void block_until(unsigned long stop_micros) {
  // micros() is an unsigned long and overflows every ~70 minutes
  // if the stop time is more than half way to the overflow point then we'll compare shifted values
  unsigned long shift = 1 << 31;
  if(stop_micros > shift) {
    stop_micros = stop_micros - shift;
    while(micros() - shift < stop_micros) {}
  } else {
    while(micros() < stop_micros) {}
  }
}

void prepareRow(char row, short layers[4]) {
  for(char brightness = 3; brightness >= 0; brightness--) {
    short out = 0;
    for(char col = 15; col >= 0; col--) {
      out |= ((image[row][col] >> brightness) & 1) << col;
    }
    out = out ^ -1;
    layers[brightness] = out;
  }
}

void scan() {
  short layers[4];

  prepareRow(3, layers);

  for(char row = 3; row >= 0; row--) {
    for(char brightness = 0; brightness < 4; brightness++) {

      // feed data to the shift registers
//      SPI.transfer(((15 << brightness) & 0x0f) ^ -1);
      SPI.transfer(layers[brightness] >> 8);
      SPI.transfer(layers[brightness]);

      // wait for the previous layer to end
      block_until(layer_end_time);

      // switch up the acutal output of the registers
      if(brightness == 0) {
        // gotta switch rows
        digitalWrite(outputDisablePin, HIGH);
        digitalWrite(rows[(row+1) % 4], LOW);
        digitalWrite(rows[row], HIGH);

        // Registers latch on a rising edge
        digitalWrite(regPin, HIGH);
        digitalWrite(outputDisablePin, LOW);
      } else {
        // no need to change rows
        // Registers latch on a rising edge
        digitalWrite(regPin, HIGH);
      }

      layer_end_time = micros() + (1<<brightness) * 50;
      digitalWrite(regPin, LOW);
    }

    prepareRow(row-1, layers);
  }
}

void loop() {
  update_frame();
  scan();
}
