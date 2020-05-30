Alien theAliens[];
Player thePlayer;
Bullet bullet;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  PImage normalImg, explodeImg;
  thePlayer = new Player(SCREENY-PLAYERHEIGHT);
  normalImg= loadImage("invader.GIF");
  explodeImg = loadImage("exploding.GIF");
  theAliens = new Alien[10];
  init_aliens(theAliens, normalImg, explodeImg);
}

void init_aliens(Alien baddies[], PImage okImg, PImage exImg) {
  for (int i=0; i<baddies.length; i++) {
    baddies[i] = new Alien(i*(okImg.width+GAP), 0, okImg, exImg);
  }
}

void draw() {
  background(255);
  for (int i=0; i<theAliens.length; i++) {
    theAliens[i].move();
    theAliens[i].draw();
  }
  thePlayer.move(mouseX);
  thePlayer.draw();
  if (bullet != null) {
    bullet.draw();
    bullet.move();
    bullet.collide(theAliens);
  }
}

void mousePressed() {
  bullet = new Bullet((mouseX+PLAYERWIDTH/2), thePlayer.ypos);
}
