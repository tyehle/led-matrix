int rows[4] = {6, 7, 8, 9};
int cols[4] = {10, 11, 12, 13};

uint8_t image[4][4];

uint8_t brightness_masks[4] = {
  0b0001,
  0b0010,
  0b0100,
  0b1000
};

#define FRAMES 5
uint8_t animation[FRAMES][4][4] = {
  { {15, 0, 0, 0},
    {15, 0, 0, 0},
    {15, 0, 0, 0},
    {15, 0, 0, 0}
  },
  { {7, 0, 0, 0},
    {7, 0, 0, 0},
    {7, 0, 0, 0},
    {7, 0, 0, 0}
  },
  { {3, 0, 0, 0},
    {3, 0, 0, 0},
    {3, 0, 0, 0},
    {3, 0, 0, 0}
  },
  { {1, 0, 0, 0},
    {1, 0, 0, 0},
    {1, 0, 0, 0},
    {1, 0, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  }
};
// {
//   { {15, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {7, 15, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {3, 7, 0, 0},
//     {0, 15, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {1, 3, 0, 0},
//     {15, 7, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {0, 1, 0, 0},
//     {7, 3, 0, 0},
//     {15, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {0, 0, 0, 0},
//     {3, 1, 0, 0},
//     {7, 0, 0, 0},
//     {15, 0, 0, 0}
//   },
//   { {0, 0, 0, 0},
//     {1, 0, 0, 0},
//     {3, 0, 0, 0},
//     {7, 15, 0, 0}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {1, 15, 0, 0},
//     {3, 7, 0, 0}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 1, 1, 0},
//     {1, 1, 0, 0}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 1, 1, 0},
//     {0, 1, 1, 0}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 1, 1, 0},
//     {0, 0, 1, 1}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 1, 1},
//     {0, 0, 1, 1}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 0, 1},
//     {0, 0, 0, 1},
//     {0, 0, 1, 1}
//   },
//   { {0, 0, 0, 0},
//     {0, 0, 1, 1},
//     {0, 0, 0, 1},
//     {0, 0, 0, 1}
//   },
//   { {0, 0, 1, 0},
//     {0, 0, 1, 1},
//     {0, 0, 0, 1},
//     {0, 0, 0, 0}
//   },
//   { {0, 0, 1, 1},
//     {0, 0, 1, 1},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {0, 0, 1, 1},
//     {0, 0, 1, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {0, 0, 1, 1},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
//   { {0, 0, 0, 1},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0}
//   },
// };
int animation_fps = 1;
int animation_frame;
long animation_frame_duration;
long animation_frame_start;

void setup() {
  for(int i = 0; i < 4; i++) {
    pinMode(rows[i], OUTPUT);
    pinMode(cols[i], OUTPUT);
  }

  animation_frame_duration = 1000000 / animation_fps;
  animation_frame = 0;
  set_image();
  animation_frame_start = micros();
}

void set_image() {
  memcpy(image, animation[animation_frame], sizeof(uint8_t)*16);
}

void update_image() {
  if(micros() - animation_frame_start >= animation_frame_duration) {
    animation_frame = (animation_frame + 1) % FRAMES;
    set_image();
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

// the loop function runs over and over again forever
void loop() {
  // this will do one scan over the led matrix
  unsigned long scan_start = micros();
  // scans are 1600 microseconds long
  // of this 100 microseconds is reserved for board updates

  // update the image if we need to
  update_image();

  for(char brightness = 0; brightness < 4; brightness++) {
    for(int row = 0; row < 4; row++) {
      // configure the columns
      for(int col = 0; col < 4; col++) {
        digitalWrite(cols[col], brightness_masks[brightness] & image[row][col]);
      }
      // let there be light
      digitalWrite(rows[row], LOW);
      // wait for a bit so the lights are on for at least some time
      block_until(micros() + (1<<brightness) * 100);
      // turn off the row so we can start writing the next row
      digitalWrite(rows[row], HIGH);
    }
  }

//  if(micros() - scan_start > 1600) {
//    digitalWrite(13, HIGH);
//    while(true) {}
//  }

  block_until(scan_start + 1600);
}
