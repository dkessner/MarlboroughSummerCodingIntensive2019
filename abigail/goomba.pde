
class Goomba
{
  PImage goom;
  float gx = random(width-200,width);
  float gy = 770;
  float gvx = -10;
  float gvy = -10;
  boolean visible2 = true;
  
  Goomba()
  {
    goom = loadImage("goomba.png");
  }
  
  void display()
  {
    text(dist(x,y,gx,gy),500,100);
    
    if (!visible2) return;
    image(goom,gx,gy,100,70);
    gx += gvx;
    
    if(x > gx-70 && x < gx+70 && dist(x,y,gx,gy) < 105 && y > gy)
    {
      visible2 = false;
    }
    if(x > gx-50 && x < gx+50 && dist(x,y,gx,gy) < 105 && y <= gy)
    {
      gx -=150;
      lives--;
    }
  }
}
