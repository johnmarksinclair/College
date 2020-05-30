class Bomb {

  int x, y, radius, numberOfBombs = 0;

  Bomb(int xpos, int ypos) {
    x = xpos;
    y = ypos;
    radius = BOMBRADIUS;
  }

  void move() {
    y = y+1;
  }

  void draw() {
    fill(255, 0, 0);
    ellipse(int(x), int(y), radius, radius);
  }

  boolean offScreen() {
    boolean offScreen = false;
    if (y >= SCREENY) {
      offScreen = true;
    }
    return offScreen;
  }
  
  boolean collide(Player player) {
    boolean collide = false;
    if (x > player.xpos && x < (player.xpos + PLAYERWIDTH) && y < (player.ypos + PLAYERHEIGHT) && y > player.ypos) {
      collide = true;
    }
    return collide;
  }
}
