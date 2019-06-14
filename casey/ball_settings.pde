

class Ball
{
  float x = (200);
  float y = (200);
  float vx = random (1, 3) + state*2 ;
  float vy = random (1, 3) + state*2 ;
  int c = color (random(160), random (250), random(250));
  float r = 50 ; 

  Ball(float xIn, float yIn)
  {
     x = xIn;
     y = yIn;
  }

  void display ()
  {
    fill (c);
    ellipse(x, y, r*2, r*2);
    ellipse(x, y, r*2, r*2);
    
    x += vx;
    y += vy;
    
    if (x > width-r || x<r)
    {
     vx =-vx;
    }
    
    if (y> height - r || y<r)
    {
     vy=-vy;
    }
    
  }
  
  void goFaster()
  {
    
      vx *= 1.1;
      vy *= 1.1;
  }
  
  
  boolean isInside(float a, float b)
  {
    if (dist(a, b, x, y) < r*3)
      return true;
    else
      return false;
  }
 
}
