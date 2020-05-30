class Player {
  int xpos; 
  int ypos;

  Player(int screen_y) {
    xpos=SCREENX/2;
    ypos=screen_y;
  }

  void move(int x) {
    if (x>SCREENX-PLAYERWIDTH)
      xpos = SCREENX-PLAYERWIDTH;
    else 
    xpos=x;
  }

  void draw() {
    fill(0);
    rect(xpos, ypos, PLAYERWIDTH, PLAYERHEIGHT);
  }
}
