   
int state=0;

int score=0;
 
float x;
float y,vy,ay;
float t=0;
float t2=2;
float t3=1;
float t4=3;
float t5=4;
float t6=5;
float t7=6;
float t8=7;

int ground;


float blockx = 0;
float blocky = 50;
float blockvx = 30;
float blockw = 100;
float blockh = 50; 

void setup()
{
    fullScreen();
    //size(600, 600);
    noStroke();
    ground = height - 100;
    x = 0;
    y = ground;
    vy=0;
    ay= 0.2; 
}
void draw()
{
  if(state == 0)
  {
    
    drawStart();
    }
    else if (state ==1)
    {
    drawDirection();
    }
    else if (state ==2)
    {
    drawGame();
    }
   else if (state == 3)
    {
     drawEnd();
    }
   else 
    {
     drawFinish();
    }
}
void drawStart()
{
  background(204,204,255);
  fill(#060609);
  textSize(50);
  String words = "Welcome to my Game!";
  textAlign(CENTER);
  text(words,width/2, height/2);
}

void drawDirection()
{
  background(204,204,255);
  fill(#060609);
  textSize(35);
  String words = "Directions: Avoid the orbiting circles and reach the rectangle on top. Every time it is reached, 25 points are gained and there are a maximum of 100 points. Use the up arrow key to jump, and the right/left arrow keys to move in that direction. Press SPACE to start.";
  textAlign(CENTER);
  text(words,width/3, height/4,600,900);
}
void drawGame()
{
  background(177,215,245);
  y+=vy;
  vy+=ay;
   
  if(y>ground)
    y=ground;

   fill(255);
   ellipse(x,y,30,30);
   fill(127,253,190);
   rect(0,ground+10,width,100);
   
   fill(223,38,143);
   rect(blockx,blocky,100,50);
   blockx += blockvx;
   if(blockx<0 || blockx> width-blockw)
     blockvx = -blockvx;
  
  if (y-20 <= blocky +50 && blockx <x && x<= blockx +50)  
  {
    score +=25;
    x = width/2;
    y = ground;
    
  }

  fill(#1610CB);
  textSize(20);
  text("score:" +score, 300, ground + 50);
  
  if(score>=100)
  state=4;
  
  float c= 50 * cos(t) + width*.4;
  float d= 50 * sin(t) + height*.6;
  ellipse(c,d,25,25);
  
  t += .15;
  
  if (dist(x,y,c,d) < 25)
  {
    state=3;
  }
  
  float e = 75 * cos(t4) + width * .3;
  float f = 75 * sin(t4) + height * .4;
  ellipse(e,f,25,25);
  
  t4 +=  .15;
  if (dist(x,y,e,f)< 20)
  {
    state=3;
  }
 
  float w= 100 * cos(t2) + width * .6;
  float z= 100 * sin(t2) + height * .3;
  ellipse(w,z,25,25);
  
  t2 += .15;
  if (dist(x,y,w,z) <20)
  {
    state =3;
  }
  
  float a= 100 * cos(t3) + width * 0.9;
  float b= 100 * sin(t3) + height * .5;
  ellipse(a,b,25,25);
  
  t3 += .15;
  if (dist(x,y,a,b)< 22.5)
  {
    state=3;
  }
  
  float i = 100 * cos (t5) + width * .5;
  float j = 100 * sin (t5) + height* .5;
  ellipse (i,j,25,25);
  
  t5 += .15;
  if (dist (x,y,i,j)< 25)
  {
    state = 3;
  }
  
  float k = 100 * cos (t6) + width  *  .25;
  float l = 100 * sin (t6) + height * .6;
  ellipse(k,l, 25,25);
  
  t6 += .15;
  if (dist(x,y,k,l) < 25)
  {
    state = 3;
  }
  
  float m = 100 * cos (t7) + width * .13;
  float n = 100 * sin(t7) + height * .75;
  ellipse(m,n,25,25);
  
  t7 += .15;
  if (dist (x,y,m,n) < 25)
  {
    state = 3;
  }
  
  float o = 100 * cos (t8) + width * .76;
  float p = 100 * sin (t8) + height * .65;
  ellipse(o,p,25,25);
  
  t8 += .15;
  if (dist (x,y,o,p) < 25)
  {
    state = 3;
  }
}
void drawEnd()
{
  background(177,183,176);
  fill(#E81C31);
  textSize(50);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
}
void drawFinish()
{
  background(255);
  fill(#2FC93E);
  textSize(50);
  textAlign(CENTER);
  text("ACCOMPLISHED", width/2, height/2);
}

void keyPressed()
{
  if (state ==0) 
  {
    state=1;
  }
  else if (state ==1)
  {
    state=2;
  }
  else if (state==2)
  {
    if (keyCode == RIGHT) 
    x+=5;
  else if (keyCode == LEFT)
  x-=5;
  else if (keyCode == UP)
  vy=-8;
    else if (key == 'j')
      score = 100;
  }
  else if (state==3)
  {
    state=0;
    score = 0;
  }
}
