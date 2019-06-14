int state = 0;

Goomba g;
ArrayList<Goomba>goombas; 


Turtle t;
ArrayList<Turtle>turtles;


float x = 50;
float y = 760;

float vx = 0;
float vy = 0;

float cx = random(width);
float cy = random(300);


float roll = random(100,500);
float target = roll+frameCount;

float roll2 = random(100,500);
float target2 = roll+frameCount;

float ay = 0.7;

PImage Mario;
PImage rM;
boolean jumpm = false;

import processing.sound.*;
SoundFile file;
SoundFile fileS;
boolean pass = false;

int keyCount = 0;
int lives = 3;
int backgroundx = width/2;


PImage floor;
PImage bg1;
PImage b1;
PImage b2;
PImage cloud;
PImage intro;
PImage tube;
PImage heart;

boolean opening = true;
int timer = 0;


void setup()
{
  file = new SoundFile(this, "pipe.wav");
  fullScreen();
  Mario = loadImage("mario.png");
  floor = loadImage("mGorund.png");
  rM = loadImage("runningm.png");
  bg1 = loadImage("back1.png");
  b1 = loadImage("bush1.png");
  b2 = loadImage("bush2.png");
  cloud = loadImage("cloud.png");
  intro = loadImage("maro.png");
  tube = loadImage("tube.png");
  heart = loadImage("heart.png");
  
  goombas = new ArrayList<Goomba>();
  turtles = new ArrayList<Turtle>();
  
  
  for(int i = 0; i<1;i++)
  {
    goombas.add(new Goomba());
  }
  for(int i = 0; i<1;i++)
  {
    turtles.add(new Turtle());
  }
  
}

void draw()
{
  background(#B2EBFF);
  
  if(state == 0)
  {
    drawStart();
  }
  if(state == 1)
  {
    drawGame();
  }
  if(state == 2)
  {
    drawEnd();
  }
}

void drawStart()
{ 
  image(bg1,width/2,height-300,width,600);
  x+=vx;
  
  if(x >= width-350)
  {
    y+=vy;
    vy+=ay;
    image(rM,x,y,100,100);
  }
  else
  {
    image(Mario,x,y,100,100);
  }
  
  if(x > width-150)
  {
    vy = 0;
    vx = 0;
    image(Mario,x,y,100,100);
  }
  else if(y < 560)
  {
    vy = 0;
    vx = 0;
    image(Mario,x,y,100,100);
  }
  else
  {
    vy = -10;
    vx = 10;
  }
  
  if(x == width-150 && y == 560)
  {
    image(Mario,x,y,100,100);
    pass = true;
  }
  
  if(y == 560 && x == width-150 && pass == true)
  {
    file.play();
     vy = 10;
      y+=vy;
    image(Mario,x,y,50,100);
  }

  if(y > 580 && pass == true)
  {
    state = 1;
      x = 50;
    y = 760;
  }

  
  imageMode(CENTER);
  image(intro,width/2,200,500,300);
  image(floor,width/2,height-300,width,600);
  image(tube,width-150,710,150,200);

 
 
  
  if(y < height-10 && pass == true)
  {
    vy = 10;
    y+=vy;
    
  }
  
}

void drawGame()
{
  
  imageMode(CENTER);
  image(b1,300,height-130,200,100);
  image(floor,width/2,height-300,width,600);
  
  
  
  
  if(jumpm == false)
  {
    image(Mario,x,y,100,100);
  }
  else
  {
    image(rM,x,y,100,100);
  }
  //image
  //Mario.resize(100,100);
 
  x+=vx;
  
  if (y<760)
  {
    y+=vy;
  }
  
  vy+=ay;
  
  
  //ask about
  if(keyCount == 2)
  {
    
  }
  
  for(Goomba g : goombas)
    {
      g.display();
    }
  for(Turtle t : turtles)
    {
      t.displayT();
    }
  
  
  if(frameCount == target)
  {
    goombas.add(new Goomba());
    target = frameCount+random(100,500);
  }
  
  if(frameCount == target2)
  {
    turtles.add(new Turtle());
    target2 = frameCount+random(100,500);
  }
  
  
  if(lives >= 1)
  {
    image(heart,50,50,50,50);
  }
  
  if (lives >= 2)
  {
    image(heart,100,50,50,50);
  }
  
  if (lives >= 3)
  {
    image(heart,150,50,50,50);
  }

  /*if(lives <= 0)
  {
    state = 2;
  }*/
  
  
  
}
void drawEnd()
{
}

void keyPressed()
{
  if(keyCode == ENTER)
  {
    state = 1;
  }
  if(keyCode == RIGHT)
  {
    vx = 10;
  }
  else if(keyCode == LEFT)
  {
    vx = -10;
  }
  else if(keyCode == UP)
  {
    vy = -7;
    y += vy;
    jumpm = true;
    keyCount++;
  }
  else if(keyCode == DOWN)
  {
    vy = 5;
  }
}

void keyReleased()
{
  if(keyCode == RIGHT || keyCode == LEFT)
  {
    vx = 0;
  }
  if(keyCode == UP || keyCode == DOWN)
  {
    vy = 0;
    jumpm = false;
  }
}
