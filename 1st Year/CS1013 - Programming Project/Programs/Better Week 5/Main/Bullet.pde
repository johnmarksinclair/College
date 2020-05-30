class Bullet {
  int x, y, radius;

  Bullet(int xpos, int ypos) {
    x=xpos;
    y=ypos;
    radius = BULLETRADIUS;
  }

  int x() {
    return x;
  }

  int y() {
    return y;
  }

  void move()
  {
    y-=2;
  }

  void draw() {
    fill(0);
    ellipse(int(x), int(y), radius, radius);
  }

  // Simple collision method, can be improved as discussed in class
  void collide(Alien theBaddies[]) {
    for (int i=0; i<theBaddies.length; i++) {
      if (x > theBaddies[i].x() && x < theBaddies[i].x()+theBaddies[i].width() && y > theBaddies[i].y() && y < theBaddies[i].y()+theBaddies[i].height()) {
        theBaddies[i].die(); 
        return;
      }
    }
  }
}
