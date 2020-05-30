int i;
int j;
int k;
int l;
int colourR;
int colourG;
int colourB;
void setup()
{
  size(100, 100);
  noStroke();
  i=0;
  j=-99;
  k=40;
  l=40;
  colourR=0;
  colourG=127;
  colourB=254;
  frameRate(60);
}
void draw()
{
  background(0);

  fill(colourR, colourG, colourB);
  if (colourR++ >= 255)
  {
    colourR = 0;
  }
  if (colourG++ >= 255)
  {
    colourG = 0;
  }
  if (colourB++ >= 255)
  {
    colourB = 0;
  }
  
  rect(i, k, 20, 20);
  if (i++ >= 99)
  {
    i=0;
  }

  rect(j, 40, 20, 20);
  if (j++ >= 0)
  {
    j=-99;
  }
}
