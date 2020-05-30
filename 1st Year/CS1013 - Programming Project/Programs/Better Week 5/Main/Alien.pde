class Alien {
  int x, y, direction;
  int status;
  PImage normalImg, explodeImg;
  Bomb bomb;

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
      if (x+normalImg.width<SCREENX-MARGIN-1)
        x++;
      else {
        direction=BACKWARD;
        y+=normalImg.height+GAP;
      }
    } else if (x>MARGIN+1) {
      x--;
    } else {
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

    if (bomb!= null)
    {
      bomb.move();
      bomb.draw();
      if (bomb.offScreen())
      {
        System.out.println("offscreen");
        bomb = null;
      } else if (bomb.collide(thePlayer))
      {
        text("GAME OVER", 190, SCREENY/2);
        gameOver = true;
      }
    } else if (bomb == null && random(1) >= 0.997 && status == ALIEN_ALIVE)
    {
      bomb = new Bomb(x, y);
    }
  }

  int x() {
    return x;
  }
  int y() {
    return y;
  }
  int width() {
    return normalImg.width;
  }
  int height() {
    return normalImg.height;
  }

  void die() {
    if (status==ALIEN_ALIVE)
      status++;
  }
}
