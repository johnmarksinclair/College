Alien theAliens[];
Player thePlayer;
Bullet theBullet;
PImage normalImg, explodeImg;
PFont font;
Bomb bomb;
boolean gameOver;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  normalImg = loadImage("invader.GIF");
  explodeImg = loadImage("exploding.GIF");
  theAliens = new Alien[10];
  thePlayer = new Player(SCREENY-PLAYERHEIGHT);
  init_aliens(theAliens, normalImg, explodeImg);
  font = createFont("Arial", 25, true);
  gameOver = false;
}

void init_aliens(Alien baddies[], PImage okImg, PImage exImg) {
  for (int i=0; i<baddies.length; i++) {
    baddies[i] = new Alien(MARGIN+i*(okImg.width+GAP), MARGIN, okImg, exImg);
  }
}

void draw() { 
  if (!gameOver) {
    boolean allDead = true;
    background(255);
    thePlayer.move(mouseX);
    thePlayer.draw();
    if (theBullet != null) {
      theBullet.move();
      theBullet.collide(theAliens);
      theBullet.draw();
    }
    for (int i=0; i<theAliens.length; i++) {
      theAliens[i].move();
      theAliens[i].draw();
      if (theAliens[i].status == ALIEN_ALIVE) {
        allDead = false;
      }
    }

    if (allDead) {
      text("YOU WIN", 190, SCREENY/2);
      gameOver = true;
    }
  }
}

void mousePressed() {
  theBullet= new Bullet(thePlayer.x()+thePlayer.width()/2, thePlayer.y());
}
