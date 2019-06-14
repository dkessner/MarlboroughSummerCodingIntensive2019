
class Tubes
{
  PImage tube;
  float tux = random(width,width-20);
  float tuy = 770;
  float tuvx = -10;
  float tuvy = -10;
  boolean visible4 = true;
  
  Tubes()
  {
    tube = loadImage("tube.png");
  }
  
  void display()
  {
    if (!visible4) return;
    image(tube,tux,tuy,100,400);
    tux += tuvx;
    
    if(x > tux-50 && x < tux+50 && dist(x,y,tux,tuy) < 250 && vy >= 0 && y > tuy)
    {
      y = tuy + 250;
    }
  }
}
