float x = 550;
float y = 550;

float vx = 0;
float vy = 0;

boolean hitObstacle = false;
boolean win = false;

void setup()
{
  size(600, 600);
  text(" ", 0, 0);
} 

void draw()
{
  background(0); 
  fill (#15fc00);
  ellipse(x, y, 70, 70);
 
  x += vx;
  y += vy;
  
  stroke(255);
  fill (#fc0000);
beginShape();
  vertex(500, 550);
  vertex(400, 550);
  vertex(400, 450);
  vertex(500, 450);
  endShape(CLOSE);
  
  fill (#15fc00);
triangle(0,250,200,0,0,0); 
 
  fill(#fc0000);
  triangle(400, 0, 600, 0, 600, 200);
  
  stroke(255);
  fill (#fc0000);
beginShape();
  vertex(275, 275);
  vertex(275, 200);
  vertex(100, 200);
  vertex(100, 275);
  endShape(CLOSE);
  
  stroke(255);
  fill (#fc0000);
beginShape();
  vertex(400, 0);
  vertex(400, 50);
  vertex(250, 50);
  vertex(250, 0);
  endShape(CLOSE);
  
  stroke(255);
  fill (#fc0000);
beginShape();
  vertex(300, 500);
  vertex(300, 550);
  vertex(100, 550);
  vertex(100, 500);
  endShape(CLOSE);
  
  fill(#fc0000);
  ellipse(400, 250, 160, 160);
  
  fill(#fc0000);
  ellipse(200, 440, 100, 100);
  
  fill(#fc0000);
  ellipse(25, 350, 20, 20);
  
  fill(#fc0000);
  ellipse(500, 300, 20, 20);
  
  fill(#fc0000);
  ellipse(200, 150, 25, 25);
  
  fill(#fc0000);
  ellipse(200, 300, 12, 12);
  
  fill(#fc0000);
  ellipse(350, 450, 25, 25);
  
  
  if (hitObstacle == true)
  {
   fill(#fc0000);
   textSize(15);
   text("GAME OVER! Press any key to restart!", 200, 100);
  }
   
  if (win == true)
  {
  fill(#15fc00);
  textSize(15);
  text("YOU WIN!!! Press any key to replay!", 200, 100);
  }
  
  if (dist(400, 250, x, y) < 115)
    hitObstacle = true;
  
  
  if (dist(200, 440, x, y) < 85)
     hitObstacle = true;
  
  if (dist(25, 350, x, y) < 45)
     hitObstacle = true;
  
  
  if (dist(500, 300, x, y) < 45)
     hitObstacle = true;
  
  
  if (dist(200, 150, x, y) < 47.5)
     hitObstacle = true;
  
  
  if (dist(200, 300, x, y) < 41)
     hitObstacle = true;
  
  
  if (dist(350, 450, x, y) < 47.5)
     hitObstacle = true;
     
  if (65 < x && x < 310 && 165 < y && y <  310)
     hitObstacle = true;
     
  if(215 < x && x < 435 && -35 < y && y < 85)
     hitObstacle = true;
     
  if(65 < x && x < 335 && 465 < y && y < 585)
     hitObstacle = true;
     
  if(365 < x && x < 535 && 415 < y && y < 585)
     hitObstacle = true;
     
  if( y < x-365)
    hitObstacle = true;
    
  if(y<285 - 5*x/4)
    win = true;
  
  
  
  
  if (hitObstacle == true)
    delay(5);
}



void keyPressed()
{
   if (win == true || hitObstacle == true)
   {
     x = 550;
      y = 550;
      hitObstacle = false;
      win = false;
   }
  else if (hitObstacle == false)
   {
     if (keyCode == RIGHT)
     vx = 5;
     else if (keyCode == LEFT)
     vx = -5;
     else if (keyCode == UP)
     vy = -5;
     else if (keyCode == DOWN)
     vy = 5;
   }
}
 void keyReleased()
{
   if (keyCode == RIGHT || keyCode == LEFT)
   vx = 0;
   else if (keyCode == UP || keyCode == DOWN)
   vy = 0;
}

  
