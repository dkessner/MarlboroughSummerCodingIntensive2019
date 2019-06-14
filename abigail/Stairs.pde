
class Stairs
{
  PImage stair;
  float ssx = random(width,width-20);
  float ssy = 770;
  float ssvx = -10;
  float ssvy = -10;
  boolean visible3 = true;
  
  Stairs()
  {
    stair = loadImage("stairs.png");
  }
  
  void display()
  {
    if (!visible3) return;
    image(stair,ssx,ssy,100,70);
    ssx += ssvx;
    
    if(x > ssx-50 && x < ssx+50 && dist(x,y,ssx,ssy) < 85)
    {
      lives--;
      visible3 = false;
    }
  }
}
