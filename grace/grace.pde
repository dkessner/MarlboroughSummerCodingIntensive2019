
int state = 0;

float y = 850;
float vy;

float x = 100;
float vx;

float ax;
float ay;

PImage frog;
PImage lilyPad;
PImage flys;
PImage heart;
PImage ladybugImage;

float r = random (20, 50);

int score = 0;

Fly f;
ArrayList<Fly> flies;

Ladybug l;
ArrayList<Ladybug> ladybugs;

float frogRadius;
float flyRadius;
float ladybugRadius;

import processing.sound.*;
SoundFile jump;
import processing.sound.*;
SoundFile splash;
import processing.sound.*;
SoundFile win;
import processing.sound.*;
SoundFile lose;

void setup() {
  fullScreen();
  
  imageMode (CENTER);
  frog = loadImage("frog.png");
  frog.resize(100, 100);
  frogRadius = 30;
  
  lilyPad = loadImage("lilyPad.png");
  lilyPad.resize(100,100);
  
  flys = loadImage("flys.png");
  flys.resize(25, 25);
  flyRadius = 10;
  
  heart = loadImage("heart.png");
  heart.resize(50, 50);
  
  ladybugImage = loadImage("ladybugImage.png");
  ladybugImage.resize(50, 50);
  
  jump = new SoundFile(this, "jump.mp3");
  splash = new SoundFile(this, "splash.mp3");
  win = new SoundFile(this, "win.mp3");
  lose = new SoundFile(this, "lose.mp3");
  
  y = 200;
  vy = 0;
  ay = 0.3;
  
  flies = new ArrayList<Fly>();
  
  for (int i = 0; i <5; i++)
  {
    Fly f = new Fly();
    flies.add(f);
  }
  
  ladybugs = new ArrayList<Ladybug>();
  
  for (int i = 0; i <3; i++)
  {
    Ladybug l = new Ladybug();
    ladybugs.add(l);
  }
}

void draw() {
  background(#95F0FF);
  
  if (state == 0)
  {
    drawStart();
  }
  else if (state == 1 )
  {
    draw3Lives();
  }
  else if (state == 2)
  {
    draw2Lives();
  }
  else if (state == 3 )
  {
    draw1Life();
  }
  else if (state == 4 )
  {
    drawGameOver();
  }
  else if (state == 5)
  {
    drawEnd();
  }
}
  
 void drawStart()
 {
   fill(0);
   textAlign(CENTER);
  
  textSize(50);
  text("Frog Game", width/2, height/5);
  
  textSize(25);
  text("Use the arrow keys to move", width/2, height/4);
  text("Eating flies will earn you points", width/2, height/3.5);
  text("Collect 300 points to win", width/2, height/3);
  
  text("Be careful!", width/2, height/2);
  text("If the flies touch the water, you lose points", width/2, height/1.75);
  text("If you eat a ladybug, you lose points", width/2, height/1.65);
  text("If you fall in the water, you lose a life", width/2, height/1.55);
  
  textSize(50);
  text("Press 'SPACE' to start", width/2, height/1.2);
 }
 
void keyPressed()
{
  if (state == 0)
  {
    if (key == ' ')
    state = 1;
  }
  else if (state == 1)
  {
    if (keyCode == RIGHT)
      vx = 8;
    if (keyCode == LEFT)
      vx = -8;
    if (keyCode == UP)
      vy = -8;
      jump.play();
    if (keyCode == DOWN)
      vy = 5;
  }
  else if (state == 2)
  {
    if (keyCode == RIGHT)
      vx = 8;
    if (keyCode == LEFT)
      vx = -8;
    if (keyCode == UP)
      vy = -8;
      jump.play();
    if (keyCode == DOWN)
      vy = 5;
  }
  else if (state == 3)
  {
    if (keyCode == RIGHT)
      vx = 8;
    if (keyCode == LEFT)
      vx = -8;
    if (keyCode == UP)
      vy = -8;
      jump.play();
    if (keyCode == DOWN)
      vy = 5;
  }
  else if (state == 4)
  {
    if (key == ' ')
    state = 0;
    score = 0; //resets score
  }
  else if (state == 5)
  {
    if (key == ' ')
    state = 0;
    score = 0; //resets score
  }
}

void keyReleased ()
{
  if (keyCode == RIGHT)
  vx = 0;
  if (keyCode == LEFT)
  vx = 0;
}