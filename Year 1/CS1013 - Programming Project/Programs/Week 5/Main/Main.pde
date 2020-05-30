Alien theAliens[];
Player thePlayer;
Bullet bullet;
Bomb bomb;
boolean gameOver = false;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  PImage normalImg, explodeImg;
  PFont font;
  font = createFont("Arial", 25, true);
  thePlayer = new Player(SCREENY-PLAYERHEIGHT);
  normalImg= loadImage("invader.GIF");
  explodeImg = loadImage("exploding.GIF");
  theAliens = new Alien[10];
  init_aliens(theAliens, normalImg, explodeImg);
  //bomb = new Bomb(50, 50);
}

void init_aliens(Alien baddies[], PImage okImg, PImage exImg) {
  for (int i=0; i<baddies.length; i++) {
    baddies[i] = new Alien(i*(okImg.width+GAP), 0, okImg, exImg);
  }
}

void draw() {
  if (!gameOver) {
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
    if (random(1) > 0.99) {
      bomb = new Bomb((theAliens[(int)random(10)].x+(ALIENSIZE/2)), (theAliens[(int)random(10)].y+ALIENSIZE));
    }
    if (bomb != null) {
      bomb.draw();
      bomb.move();
      if (bomb.offScreen()) {
        //System.out.println("offscreen");
        bomb.numberOfBombs = 0;
      } else {
        //System.out.println("onscreen");
        bomb.numberOfBombs = 1;
      }
      if (bomb.collide(thePlayer)) {
        System.out.println("collided");
        text("Game Over", 165, SCREENY/2);
        gameOver = true;
      }
    }
  }
}

void mousePressed() {
  bullet = new Bullet((mouseX+PLAYERWIDTH/2), thePlayer.ypos);
}
