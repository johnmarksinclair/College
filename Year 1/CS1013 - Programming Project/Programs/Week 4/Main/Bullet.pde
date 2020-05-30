class Bullet {

  int x;
  int y;
  int radius;

  Bullet(int xPos, int yPos) {
    x = xPos;
    y = yPos;
    radius = BULLETRADIUS;
  }

  void move() {
    y = y-2;
  }

  void draw() {
    fill(0);
    ellipse(int(x), int(y), radius, radius);
  }

  void collide(Alien[] aliens) {
    for (int i = 0; i < aliens.length; i++) {
      if (x > aliens[i].x && x < (aliens[i].x+ALIENSIZE) && y < (aliens[i].y+ALIENSIZE) && y > aliens[i].y) {
        aliens[i].explode();
      }
    }
  }
}
