int i;
int j;
int k;
void setup()
{
  size(100, 100);
  noStroke();
  i=40;
  j=50;
  k=30;
  frameRate(5);
}
void draw()
{
  background(0);

  fill(255, 0, 0);
  rect(50, j, 20, 20);
  j++;

  fill(0, 0, 255);
  rect(k, 30, 20, 20);
  k--;

  fill(0, 255, 0);
  rect(i, 40, 20, 20);
  i++;
}
