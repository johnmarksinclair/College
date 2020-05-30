int i;
int j;
void setup()
{
  size(100, 100);
  noStroke();
  i=0;
  j=-99;
  frameRate(60);
}
void draw()
{
  background(0);

  fill(0, 255, 0);
  rect(i, 40, 20, 20);
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
