class Player {
  int x, y, width, height;

  color playerColor = color(250);

  Player(int screen_y)
  {
    x=SCREENX/2;
    y=screen_y;
    width=PLAYERWIDTH;
    height=PLAYERHEIGHT;
  }

  /* Move the player to the position given as argument, but make sure
   there is still room to draw the full player on the screen, ie. don't
   go too far to the right */
  void move(int screen_x) {
    if (screen_x>SCREENX-width) x = SCREENX-width;
    else x=screen_x;
  }

  int x() {
    return x;
  }
  int y() {
    return y;
  }
  int width() {
    return width;
  }
  void draw()
  {
    fill(playerColor);
    rect(x, y, width, height);
  }
}
