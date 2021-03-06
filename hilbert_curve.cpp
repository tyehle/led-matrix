// From wikipedia: https://en.wikipedia.org/wiki/Hilbert_curve#Applications_and_mapping_algorithms

//rotate/flip a quadrant appropriately
void rot(char n, char* x, char* y, char rx, char ry) {
    if (ry == 0) {
        if (rx == 1) {
            *x = n-1 - *x;
            *y = n-1 - *y;
        }

        //Swap x and y
        char t  = *x;
        *x = *y;
        *y = t;
    }
}

//convert (x,y) to d
char xy2d (char n, char x, char y) {
    char rx, ry, s, d=0;
    for (s=n/2; s>0; s/=2) {
        rx = (x & s) > 0;
        ry = (y & s) > 0;
        d += s * s * ((3 * rx) ^ ry);
        rot(n, &x, &y, rx, ry);
    }
    return d;
}

//convert d to (x,y)
void d2xy(char n, char d, char* x, char* y) {
    int rx, ry, s, t=d;
    *x = *y = 0;
    for (s=1; s<n; s*=2) {
        rx = 1 & (t/2);
        ry = 1 & (t ^ rx);
        rot(s, x, y, rx, ry);
        *x += s * rx;
        *y += s * ry;
        t /= 4;
    }
}

#define TAIL_LEN 20
char profile[TAIL_LEN] = {1, 2, 6, 15, 13, 10, 9, 7, 6, 5, 4, 4, 3, 2, 2, 2, 1, 1, 1, 0};
char* tail[TAIL_LEN] = {};

void step_image(int frame, char image[8][16]) {
    // cycle the tail
    for(char i = TAIL_LEN - 1; i > 0; i--) {
        tail[i] = tail[i-1];
    }

    // set tail[0]
    if(tail[1] == nullptr && tail[2] == nullptr) {
        // time to turn on another light
        char x, y;
        d2xy(16, frame / 3, &x, &y);
        tail[0] = &image[x][y];
    } else {
        tail[0] = nullptr;
    }

    // set all the values
    for(char i = TAIL_LEN - 1; i >= 0; i--) {
        if(tail[i] != nullptr) {
            *tail[i] = profile[i];
        }
    }
}
