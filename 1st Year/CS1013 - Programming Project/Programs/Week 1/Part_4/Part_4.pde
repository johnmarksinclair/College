int i;
int j;
int k;
int l;
void setup()
{
  size(100, 100);
  noStroke();
  i=0;
  j=-99;
  k=79;
  l=179;
  frameRate(60);
}
void draw()
{
  background(0);

  fill(0, 255, 0);
  rect(i, 25, 20, 20);
  if (i++ >= 99)
  {
    i=0;
  }

  rect(j, 25, 20, 20);
  if (j++ >= 0)
  {
    j=-101;
  }

  fill(0, 0, 255);
  rect(k, 55, 20, 20);
  if (k-- <= -21)
  {
    k=79;
  }

  rect(l, 55, 20, 20);
  if (l-- <= 79)
  {
    l=179;
  }
}
