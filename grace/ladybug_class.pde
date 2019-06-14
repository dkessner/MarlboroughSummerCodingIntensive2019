class Ladybug
{
  float lx = random(25, 1275);
  float ly = random(25, 250);
  float vy = 3;
  float vx = random(-2, 2);
  float ladybugRadius = 10;
  float r = random (20, 50);
  
  void update()
  {
    ly += vy;
    lx -= vx;
  }
  
  void display()
  {
    ellipse (lx, ly, ladybugRadius, ladybugRadius);
    image (ladybugImage, lx, ly);  
    
    if (lx> width-r || lx<r)
      vx = -vx;
  }
}