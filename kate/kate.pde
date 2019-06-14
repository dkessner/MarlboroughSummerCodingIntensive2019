
int state = 0;

boolean gameover= false, right = false, left = false, d = false, a = false;
int topscore = 0;
int bottomscore = 0;
float changespeed = 0;
Paddle bottom;
Paddle top;
Ball ball;










void setup()
{
  size(500, 500);
  frameRate(100);
  noStroke();
  ball = new Ball();
  bottom = new Paddle();
  top = new Paddle();
  top.y=0;
}










void draw()
{
  background(255);
  
   if (state == 0)
  {
    drawStart();
  }
  else if (state == 1)
  {
    drawDirections();
  }
  else if (state == 2)
  {
    drawGame();
  }
  else
  {
     drawEnd();
  }
}










void drawStart()
{
  fill(#DCA5FF);
  textSize(35);
  text ("TWO PLAYER PING PONG!", 35, 230);
  textSize(25);
  text ("(Press any key to continue)", 87.5, 275);
  textSize(15);
  text ("Made by Kate Yamaguchi", 162.5, 450);
  text ("Summer Coding Intensive 2019", 137.5, 467.5);
  text ("Dr. Kessner", 212.5, 485);
}










void drawDirections()
{
  background(255);
  fill(#DCA5FF);
  textSize(37.5);
  text("Directions", 162.5, 200);
  textSize(15);
  text("Top Player: Use the a and d keys to move", 100, 275);
  text("Bottom Player: Use the left and right arrow keys to move", 50, 300);
  textSize(25);
  text ("(Press any key to start)", 112.5, 375);
}










void drawGame()
{
  bottom.show();
  top.show();
    
  if (left == true)
  {
    bottom.moveleft();
  }
  if (right == true)
  {
    bottom.moveright();
  }
  if (a == true)
  {
    top.moveleft();
  }
  if (d == true)
  {
    top.moveright();
  }
    
  ball.move();
  ball.bounce();
  ball.show();
    
  if (ball.y<-10)
  {
    gameover = true;
    bottomscore++;
    state = 3;
  }
  if (ball.y>510)
  {
    gameover = true;
    topscore++;
    state = 3;
  }
}










void drawEnd()
{
  changespeed = 0;
  fill(0);
  textSize(15);
  text("Top Player's Score: " + topscore, 15, 290);
  text("Bottom Player's Score: " +bottomscore, 15, 330);
  fill(255, 0, 0);
  textSize(27);
  text("Game Over! Press any key to restart.", 15, 225);

}










void resetGame()
{
  //if (keyPressed == true)
  {
    ball.x = int (random(200, 301));
    ball.y = int (random(200, 301));
    int xdirection = int(random(2));
    int ydirection = int(random(2));
    
    if (xdirection == 0)
    {
      ball.right = true;
    }
    else
    {
      ball.right = false;
    }
    if (ydirection == 0)
    {
      ball.up = true;
    }
    else
    {
      ball.up = false;
    }
    gameover = false;
  }  
}










void keyPressed()
{
  if (state == 0)
  {
    state = 1;
  }
  else if (state == 1)
  {
    state = 2;
  }
  else if (state == 2)
  {
    if (keyCode == LEFT)
    {
      left = true;
    }
    if (keyCode == RIGHT)
    {
      right = true;
    }
    if (key == 'a')
    {
      a = true;
    }
    if (key == 'd')
    {
      d = true;
    }
  }
  else if (state == 3)
  {
    state = 2;
    resetGame();
  }
}










void keyReleased()
{
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode == RIGHT)
  {
    right = false;
  }
  if (key == 'a')
  {
    a = false;
  }
  if (key == 'd')
  {
    d = false;
  }
}










class Paddle
{
  int x, y;
  Paddle ()
  {
    x = 250;
    y = 495;
  }
  void show()
  {
    fill(#46B0FF);
    rect(x, y, 60, 5);
  }
  void moveleft()
  {
    if (x>=0)
    {
      x-=5;
    }
  }
  void moveright()
  {
    if (x<=445)
    {
      x+=5;
    }
  }
}










class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=15;
    y=485;
    up=true;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y=int(y-2-changespeed/2);
    }
    else  //up==false
    {
      y=int(y+2+changespeed/2);
    }
    if (right==true)
    {
      x=int(x+2+changespeed);
    }
    else  //right==false
    {
      x=int(x-2-changespeed);
    }
  }
  void bounce()
  {
    if (get(int(x)-8, int(y))!=color(255))
    {
      right=true;
    }
    if (get(int(x)+8, int(y))!=color(255))
    {
      right=false;
    }
    if (get(int(x), int(y)-8)==color(#46B0FF))
    {
      up=false;
    }
    if (get(int(x), int(y)+8)==color(#46B0FF))
    {
      up=true;
      changespeed+=1.0/4;
    }
  }
  void show()
  {
    fill(#FFED1F);
    ellipse(x, y, 16, 16);
  }
}
