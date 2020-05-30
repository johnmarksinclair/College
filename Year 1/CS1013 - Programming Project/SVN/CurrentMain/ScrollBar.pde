class VScrollbar {
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  VScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int heighttowidth = sh - sw;
    ratio = (float)sh / (float)heighttowidth;
    xpos = xp-swidth/2;
    ypos = yp;
    spos = ypos - swidth/2;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + sheight - swidth;
    loose = l;
  }

  void update() {
    if (over()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseY-swidth/2, sposMin, sposMax);     
    }
    if (abs(newspos - spos) > 1) {
     // spos = spos + (newspos-spos)/loose;
     spos = spos + (newspos-spos);
    }
    if(!locked){
      newspos = spos;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    restrain();
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(180);
    } else {
      fill(140);
    }
    rect(xpos, spos, 40, 50);
    
  }
  
  void restrain() {
    if (spos < 0) {
      spos = 0;
    }
    if (spos > SCREENY - 50) {
      spos = SCREENY - 50;
    }
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
// By Paul
