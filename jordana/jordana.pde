float x = 100;
float y = 550;

float gravity = 0.4; 

float vy = 0;
float vx = 0;

int lives = 3;

int score = 0;
int highScore = 0;

int coverX = 270;

int state = 0;

float vo = 2;
float a = 400;
float a2 = 900;
float a3 = 1350;

float b = random(75, 200);
float b2 = random(75, 200);
float b3 = random(100, 225);

float coinY = b;
float coinX = a;

boolean coinVisible = true;

PImage redHeart;
float alarm;


void setup()
{
  
  fullScreen();
  redHeart = loadImage("redHeart.png");
  
}

void draw()
{
  
  if(state == 0)
  {
    drawStart();
    noCursor();
  }
  
  else if(state == 1)
  {
    drawGame();
    noCursor();
  }
  
  else if(state == 2)
  {
    drawGameOver();
    if (millis() > alarm)
      state = 3;
  }
  
  else if(state == 3)
  {
    drawEnd();
  }
}

void drawStart()
{
  
  background(255);
  fill(0);
  textSize(100);
  text("Press space to start!", 190, height/2);
  lives = 3;
  score = 0;
  coverX = 270;
}

void drawGame()
{
  
  
  if(score < 1000)
  {
    vo = 3;
  }
  
  else if(score > 1000 && score < 3000)
  {
    vo = 4;
  }
  
  else if(score > 3000 && score < 5000)
  {
    vo = 5;
  }
  
  else if(score > 5000 && score < 10000)
  {
    vo = 6;
  }
  
  else if(score > 10000)
  {
    vo = 7;
  }
 
  if(lives <= 0)
  {
    state += 1;
    alarm = millis() + 3000;
  }
  
  if(score > highScore)
  {
    highScore = score;
  }
  
  
   background(#B9DDFF);
  redHeart.resize(0, 50);
  image(redHeart, 100, 125);
  image(redHeart, 160, 125);
  image(redHeart, 220, 125);
  
  stroke(#B9DDFF);
  fill(#B9DDFF);
  rectMode(CORNER);
  rect(coverX, 120, 300, 200);
  
 float ya = 570 - b;
 float yb = 570 - b2;
 float yc = 570 - b3;
  stroke(0);
  fill(#4FAF3C);
  rectMode(CORNER);
  rect(0, 570, 1500, 200);

  fill(225);
  stroke(0);
  rectMode(CENTER);
  ellipse(x, y, 20, 20);
  x = x + vx;
  y = y + vy;

  vy = vy + gravity;

  if (y > 560) {

    vy = 0;
    y = 560;
  }
 if (y <= 200)
 {
   vy = -vy;
 }
 
 fill(#4FAF3C);
 stroke(0);
 rectMode(CORNER);
 rect(a, 570 - b, 20, b);
 
 rect(a2, 570 - b2, 20, b2);
 
 rect(a3, 570 - b3, 20, b3);
 
 a -= vo;
 a2 -= vo;
 a3 -= vo;
 
 if(a <= -30)
 {
   a = width;
   b = random(75, 200);
   score += 100;
   coinVisible = true;
 }
 
 if(a2 <= -30)
 {
   a2 = width;
   b2 = random(75, 200);
   score += 100;
 }

  if(a3 <= -30)
 {
   a3 = width;
   b3 = random(100, 225);
   score += 100;
 }
 //this is the rectangle hit code!!! DO NOT ADJUST
 if(x + 10 > a && x - 10 < a + 20 && y > 570 - b)
 {
    lives -= 1;
    x = 100;
    a = 400;
    a2 = 900;
    a3 = 1350;
    coverX -= 60;
 }
 
 if(x + 10 > a2 && x - 10 < a2 + 20 && y > 570 - b2)
 {
   lives -= 1;
   x = 100;
   a = 400;
   a2 = 900;
   a3 = 1350;
   coverX -= 60;
 }
 
 if(x + 10 > a3 && x - 10 < a3 + 20 && y > 570 - b3)
 {
   lives -= 1;
   x = 100;
   a = 400;
    a2 = 900;
    a3 = 1350;
    coverX -= 60;
 }
 fill(0);
 text("Score:" + score, 50, 100); 
 

 
 
  coinX = a + 10;
  coinY = 500 - b;
  
  if(coinVisible)
  {
  
  stroke(0);
  fill(#FFEB4D);
  ellipse(coinX, coinY, 20, 20);
  
  stroke(#DEA324);
  fill(#DEA324);
  ellipse(coinX, coinY, 3, 10);
  
  if(dist(x, y, coinX, coinY)<30)
  {
 
    score += 200;
    
    coinVisible = false;
    
  }
  
  }
  
  
}
 
 
void drawGameOver()
{
  background(75);
  fill(255);
  text("Game Over", 400, 400);
}

void drawEnd()
{
  
 background(255);
 fill(0);
 text("Your Score:" + score, 100, 300);
 text("High Score:" + highScore, 100, 500);

}

void keyPressed()
{
  
  if(state == 0)
  {
    if(key == ' ')
    {
      state += 1;
    }
  }
    
    else if(state == 1)
 {
      if(keyCode == RIGHT)
  vx = 5;
  
  if(keyCode == LEFT)
  vx = -5;
  
  if(keyCode == UP)
      {
    if(y == 560)
        {
      vy = -15;
        }
      }
      
   if(key == 'u')
   {
     score += 100;
   }
      
 }
    else if(state == 2)
    {
      if(key == ' ')
      {
        state = 3;
      }
    
  }
  
  else if(state == 3)
    {
      if(key == ' ')
      {
        state = 0;
      }
    
    }
}


void keyReleased()
{
  if(keyCode == RIGHT||keyCode == LEFT)
{
  vx = 0;
} 
  
  if(keyCode == UP||keyCode == DOWN)
  {
  vy = vy * 0.9;
  }
 
}

    
   
