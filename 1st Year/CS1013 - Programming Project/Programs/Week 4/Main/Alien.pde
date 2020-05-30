class Alien {
  int x, y, direction;
  int status;
  PImage normalImg, explodeImg;

  Alien (int xpos, int ypos, PImage okImg, PImage exImg) {
    x = xpos;
    y = ypos;
    status = ALIEN_ALIVE;
    normalImg=okImg;
    explodeImg=exImg;
    direction=FORWARD;
  }

  void move() {
    if (direction==FORWARD) {
      if (x+normalImg.width<SCREENX-1) {
        x++;
      } else {
        direction=BACKWARD;
        y+=normalImg.height+GAP;
      }
    } else if (x>0) x--;
    else {
      direction=FORWARD;
      y+=normalImg.height+GAP;
    }
  }

  void draw() {
    if (status==ALIEN_ALIVE) {
      image(normalImg, x, y);
    } else if (status!=ALIEN_DEAD) {
      image(explodeImg, x, y);
      status++;
    }
    // otherwise dead, don't draw anything
  }

  void explode() {
    status = 5;
  }
}
