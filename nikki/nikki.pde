int state = 0;
int x = 100;
int y = 550;

int scoreRed = 0;
int scoreGreen = 0;

int vy  = 0;
int vx = 0;
int x2 = 500;
int y2 = 525;
int vx2 = 0;
int vy2 = 0;

PImage Ember2;
PImage Wyrm;
PImage House2;

void setup()
{
  size(600, 600);
House2 = loadImage("House2.jpg");
House2.resize(600, 600);

Ember2 = loadImage("Ember2.gif");
Ember2.resize(125, 125);

Wyrm = loadImage("Wyrm.jpg");
Wyrm.resize(200, 150);
}


void drawStart()
{
  fill(#FF0000);
  text("Welcome to my game called Talon, after the cold- blooded organazation that has dominated dragonkind. the arrow keys control the leader of the orginazation, the Elder Wyrm. WASD control the leader of the resistance, Ember. Ember must get to the safe house to rescue the dragons. The Elder Wyrm however, aims to destroy the safe house, and squash the resistance. This game was inspired by the Talon Saga by Julie Kagawa. Good Luck!", 
  100, 300, 400, 400);
}

void drawGame()
{
  imageMode(CENTER);
  image(Wyrm, x2, y2);
  
  fill(#FFCBDB);
  
  imageMode(CENTER);
  image(Ember2, x, y);
  
  if (320 < x && x < 380 && 150 < y && y < 240)
    {
     scoreRed += 1;
     x = 100;
     y = 550;
    }
  noFill();
  ellipse(125, 498, 130, 25);
  
  fill(#E00B0B);
  text("Ember: " + scoreRed, 100, 500);
  //text(x + " " + y, 100, 550);
  
  if (scoreRed >= 10)
  state = 2;
  
  if (dist(x, y, ballx, bally) < 30)
  {
     if (scoreRed > 0)
       scoreRed = 0;
     x = 100;
     y = 550;
  }
  
  fill(#E00B0B);
  text("The Elder Wyrm: " + scoreGreen, 400, 400);
  
  if (scoreGreen >= 10)
  state = 2;
  
  if (dist(x,y,x2,y2) < 50)
    {
     scoreGreen += 1;
     scoreRed -= 1;
     x2 = 500;
     y2 = 525;
    }
    
}


void drawEnd()
  {
    fill(#FFCBDB);
    text("GAME OVER!!!", width/2, height/2);
  }

void keyPressed()
{
 
  if (state == 0)
 {
   state = 1;
 }
 else if (state == 1)
 {
   if (keyCode == RIGHT)
       x2 += 25;
   else if (keyCode == LEFT)
       x2 -= 25;
   else if (keyCode == UP)
       y2 -= 25;
   else if (keyCode == DOWN)
       y2 += 25;
 }
 else if (state == 2)
 {
  state = 0;
  scoreRed = 0;
  scoreGreen = 0;
 }
  
  if (state == 0)
 {
   state = 1;
 }
 else if (state == 1)
 {
   if (keyCode == 'D')
       x += 25;
   else if (keyCode == 'A')
       x -= 25;
   else if (keyCode == 'W')
       y -= 25;
   else if (keyCode == 'S')
       y += 25;
 }
 else if (state == 2)
 {
  state = 0;
  scoreRed = 0;
  scoreGreen = 0;
 }
}


void keyReleased()
{
if (keyCode == 'A' || keyCode == 'D')
  vx = 0;
else if (keyCode == 'W' || keyCode == 'S')
  vy = 0;

if (keyCode == RIGHT || keyCode == LEFT)
  vx2 = 0;
else if (keyCode == UP || keyCode == DOWN)
  vy2 = 0;
}
