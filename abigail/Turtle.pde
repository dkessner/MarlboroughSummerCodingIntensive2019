

class Turtle
{
  PImage turt;
  PImage shell;
  float tx = random(width-200,width);
  float ty = 770;
  float tvx = -10;
  float tvy = -10;
  boolean visible = true;
  
  float sx = tx+5;
  float sy = 770;
  float svx = -10;
  float svy = -10;
  
  Turtle()
  {
    turt = loadImage("turtle.png");
    shell = loadImage("shell.png");
  }
  
  void displayT()
  {
    text(dist(x,y,tx,ty),500,300);
    
    if (!visible) return;
    
    image(turt,tx,ty,100,70);
    tx += tvx;
    
    if(x > tx-70 && x < tx+70 && dist(x,y,tx,ty) < 120 && y > ty)
    {
        visible = false;
        sx+=svx;
        image(shell,sx,sy,70,70);
    }
    if(x > tx-50 && x < tx+50 && dist(x,y,tx,ty) < 120 && y <= ty)
    {
      tx-=150;
      lives--;
    }
  }
}
