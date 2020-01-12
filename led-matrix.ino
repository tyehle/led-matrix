#include <SPI.h>

int regPin = 10;
int outputDisablePin = 3;

int rows[4] = {6, 7, 8, 9};

uint8_t image[4][4];

uint8_t brightness_masks[4] = {
  0b0001,
  0b0010,
  0b0100,
  0b1000
};

#define FRAMES 20
uint8_t animation[FRAMES][4][4] = {
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {15, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {7, 15, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {3, 7, 0, 0},
    {0, 15, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {1, 3, 0, 0},
    {15, 7, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 1, 0, 0},
    {7, 3, 0, 0},
    {15, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 0, 0},
    {3, 1, 0, 0},
    {7, 0, 0, 0},
    {15, 0, 0, 0}
  },
  { {0, 0, 0, 0},
    {1, 0, 0, 0},
    {3, 0, 0, 0},
    {7, 15, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {1, 15, 0, 0},
    {3, 7, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 7, 15, 0},
    {1, 3, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 3, 7, 0},
    {0, 1, 15, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 1, 3, 0},
    {0, 0, 7, 15}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 1, 15},
    {0, 0, 3, 7}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 15},
    {0, 0, 0, 7},
    {0, 0, 1, 3}
  },
  { {0, 0, 0, 0},
    {0, 0, 15, 7},
    {0, 0, 0, 3},
    {0, 0, 0, 1}
  },
  { {0, 0, 15, 0},
    {0, 0, 7, 3},
    {0, 0, 0, 1},
    {0, 0, 0, 0}
  },
  { {0, 0, 7, 15},
    {0, 0, 3, 1},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 3, 7},
    {0, 0, 1, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 1, 3},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 0, 1},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  }
};
int animation_fps = 10;
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
  animation_frame_start = micros();

  layer_end_time = micros() + 10000;
}

void update_frame() {
  if(micros() - animation_frame_start >= animation_frame_duration) {
    animation_frame = (animation_frame + 1) % FRAMES;
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
    for(char col = 3; col >= 0; col--) {
      out |= ((animation[animation_frame][row][col] >> brightness) & 1) << col;
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
      SPI.transfer(((15 << brightness) & 0x0f) ^ -1);
//      SPI.transfer(layers[brightness] >> 8);
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

//void loop() {
//  // this will do one scan over the led matrix
//  unsigned long scan_start = micros();
//  // scans are supposed to be 10000 microseconds long
//
//  // update the image if we need to
//  update_frame();
//
//  for(char brightness = 0; brightness < 4; brightness++) {
//    for(int row = 0; row < 4; row++) {
//      // configure the columns
//      char out = 0;
//      for(int col = 0; col < 4; col++) {
//        out |= ((animation[animation_frame][row][col] >> brightness) & 1) << col;
//      }
//      out = out ^ -1;
//      SPI.transfer(out);
//      SPI.transfer(out);
//      digitalWrite(regPin, HIGH);
//      digitalWrite(regPin, LOW);
//      
//      // let there be light
//      digitalWrite(rows[row], HIGH);
//      // wait for a bit so the lights are on for at least some time
//      block_until(micros() + (1<<brightness) * 100);
//      // turn off the row so we can start writing the next row
//      digitalWrite(rows[row], LOW);
//    }
//  }
//
//  block_until(scan_start + 1000);
//}
