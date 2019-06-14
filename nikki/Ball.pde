int ballx = 200;
int ballvx = 19;
int bally = 200;
int ballvy = 21;
int ballr = 25;
int c = color(#F4CBFF);







void draw()
{

  background(House2);
  
  if (state == 0)
  {
    drawStart();
  }
  else if (state == 1)
  {
   drawGame();
  }
  else



  
  background(0);
fill(c);
ellipse(ballx, bally, 2*ballr, 2*ballr);

if (frameCount % 1 == 0)
{
    c = color(random(255), random(255), random(255));
}


 
  
  ballx += ballvx;
  bally += ballvy;
  
  if (ballx < ballr || ballx > width-ballr)
    ballvx = -ballvx;
    
  if (bally < ballr || bally > height-ballr)
    ballvy = -ballvy; 
}
