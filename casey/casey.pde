



int state = 0;
float r;
float score = 0;

PFont f;

ArrayList<Ball> balls;

void setup()
{
  fullScreen();

  f = createFont("Constantia", 72);
  balls = new ArrayList<Ball>();
  r = 100;
  
  noCursor();
}



void draw()
{
  
  if (state == 0)
  {
    drawStart();
  }
  if (state == 1)
  {
    drawGame();
  }
  if (state == 2)
  {
    drawGame();
  }
  if (state == 3)
  {
    drawGame();
  }
  if (state == 4)
  {
    drawEnd();
  }
  if (state == 5)
  {
    drawWin();
  }

}


void drawStart()
{
 background (#98c8d3);
 fill(255);
 textAlign (LEFT);
 textFont(f);
 textSize (64);
 text ("Welcome to Casey's Game!", 100, 400); 
 text ("Try to keep your white circle from touching any other circles.", 100, 500);
 text ("The longer you survive, the harder it will get! Good luck!", 100, 600);
}

void drawGame()
{
  
  background(#ddfff6);
  for(Ball b : balls)
    b.display();
  
  fill(255);
  
  
  float cursorX = constrain(mouseX, r, width-r);
  float cursorY = constrain(mouseY, r, height-r);
  ellipse(cursorX, cursorY, r*2, r*2);

  textSize (48);
  textAlign (LEFT);
  textFont (f);
  textSize(72);
  fill (#10047a);
  text ("score:" + score, 50, 75); 
  //text ("level:" + state, 50, 150);
 
  int period = 60;
  int frame = frameCount%(period*10);
  if (frame>0 && frame%period == 0)
  {
     addBall();
     score += 1;
     
     if (score == 10)
     {
       println("hello");
       changeState();
     } 
 
  }
  if (score == 10)
  {
    textAlign (CENTER);
    text ("level up!", width/2, height/2); 
  }
  if (score == 20)
  {
    textAlign (CENTER);
    text ("level up!", width/2, height/2); 
  }
  
  // detect collisions
  
  for (Ball b : balls)
  {
     if (b.isInside(mouseX, mouseY))
     {
       state = 4;
       break;
     }
  
     for (Ball c : balls)
     {
       if (b == c) continue;
       if (dist(b.x, b.y, c.x, c.y) < 100)
       {
          b.vx = -b.vx;
          b.vy = -b.vy;
       }
     }
  }
}

void changeState()
{
  if (score == 10)
    state = 2;
  else if (score == 20)
    state = 3;
  else if (score == 30)
    state = 5;  
   
  balls = new ArrayList<Ball>();
}


int lastCorner = 0;

void addBall()
{
  int corner = lastCorner;
  while (corner == lastCorner)
    corner = (int)random(0, 4);
 
  if (corner == 0)
    balls.add(new Ball(100, 100));
  else if (corner == 1)
    balls.add(new Ball(1800, 100));
  else if (corner == 2)
    balls.add(new Ball(100, 900));
  else if (corner == 3)
    balls.add(new Ball(1800, 900));
      
}



void drawEnd ()
{
  textSize (72);
  fill (#10047a);
  textAlign (CENTER);
  text("game over :(", width/2, height/2);
  text ("press to play again", width/2, height/1.5);
}

void drawWin()
{
 background (#98c8d3);
 textSize (72);
 fill (255);
 textAlign (CENTER);
 text ("you win!!", width/2, height/2);
 text ("press to play again", width/2, height/1.5);
}

void keyPressed()
{
 if (state ==0)
 {
   state = 1;
 }
 if (state == 4)
 {
  state = 0; 
  score = 0;
  balls = new ArrayList<Ball>();
 }
 if (state == 5)
  state = 0; 
  score = 0;
  balls = new ArrayList<Ball>();
 
 if (key == '1')
 {
   score = 9;
   //state = 1;
 }
 else if (key == '2')
   score = 19;
 else if (key == '3')
   score = 29;
}
