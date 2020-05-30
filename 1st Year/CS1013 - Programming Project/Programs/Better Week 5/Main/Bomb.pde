class Bomb {

  int x, y, radius;

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
    if ((y+(BOMBRADIUS/2)) >= SCREENY) {
      return true;
    }
    return false;
  }
  
  boolean collide(Player player) {
    boolean collide = false;
    if (x > player.x && x < (player.x + PLAYERWIDTH) && y < (player.y + PLAYERHEIGHT) && y > player.y) {
      collide = true;
    }
    return collide;
  }
}
