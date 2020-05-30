int i;
void setup()
{
  size(100, 100);
  noStroke(); 
  fill(255, 204, 0);
  i=0;
  frameRate(10);
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
}
