int rows[4] = {6, 7, 8, 9};
int cols[4] = {10, 11, 12, 13};

int image[4][4];

#define FRAMES 19
int animation[FRAMES][4][4] = {
  { {1, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {1, 1, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {1, 1, 0, 0},
    {0, 1, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {1, 1, 0, 0},
    {1, 1, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 1, 0, 0},
    {1, 1, 0, 0},
    {1, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 0, 0},
    {1, 1, 0, 0},
    {1, 0, 0, 0},
    {1, 0, 0, 0}
  },
  { {0, 0, 0, 0},
    {1, 0, 0, 0},
    {1, 0, 0, 0},
    {1, 1, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {1, 1, 0, 0},
    {1, 1, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 1, 1, 0},
    {1, 1, 0, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 1, 1, 0},
    {0, 1, 1, 0}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 1, 1, 0},
    {0, 0, 1, 1}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 1, 1},
    {0, 0, 1, 1}
  },
  { {0, 0, 0, 0},
    {0, 0, 0, 1},
    {0, 0, 0, 1},
    {0, 0, 1, 1}
  },
  { {0, 0, 0, 0},
    {0, 0, 1, 1},
    {0, 0, 0, 1},
    {0, 0, 0, 1}
  },
  { {0, 0, 1, 0},
    {0, 0, 1, 1},
    {0, 0, 0, 1},
    {0, 0, 0, 0}
  },
  { {0, 0, 1, 1},
    {0, 0, 1, 1},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 1, 1},
    {0, 0, 1, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 1, 1},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
  { {0, 0, 0, 1},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
  },
};
int animation_fps = 10;
int animation_frame;
long animation_frame_duration;
long animation_frame_start;

void setup() {
  for(int i = 0; i < 4; i++) {
    pinMode(rows[i], OUTPUT);
    pinMode(cols[i], OUTPUT);
  }

  animation_frame_duration = 1000 / animation_fps;
  animation_frame = 0;
  set_image();
  animation_frame_start = millis();
}

void set_image() {
  memcpy(image, animation[animation_frame], sizeof(int)*16);
}

void update_image() {
  if(millis() - animation_frame_start >= animation_frame_duration) {
    animation_frame = (animation_frame + 1) % FRAMES;
    set_image();
    animation_frame_start = millis();
  }
}

// the loop function runs over and over again forever
void loop() {
  // update the image if we need to
  update_image();

  for(int row = 0; row < 4; row++) {
    // configure the columns
    for(int col = 0; col < 4; col++) {
      digitalWrite(cols[col], image[row][col]);
    }
    // let there be light
    digitalWrite(rows[row], LOW);
    // wait for a bit so the lights are on for at least some time
    delay(1);
    // turn off the row so we can start writing the next row
    digitalWrite(rows[row], HIGH);
  }
}
