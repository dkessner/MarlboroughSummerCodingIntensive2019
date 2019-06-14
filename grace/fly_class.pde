class Fly
{
  float fx = random(25, 1275);
  float fy = random(25, 250);
  float vy = 1;
  float vx = random(-1, 1);
  float flyRadius = 10;
  float r = random (20, 50);
  
  void update()
  {
    fy += vy;
    fx -= vx;
  }
  
  void display()
  {
    ellipse (fx, fy, flyRadius, flyRadius);
    image (flys, fx, fy);  
    
        
    if (fx> width-r || fx<r)
      vx = -vx;
  }
}