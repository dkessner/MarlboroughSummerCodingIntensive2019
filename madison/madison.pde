float gameScreen = 0;
int score = 0;
color ballColor = color(random(255),random(255),(255));
color rectColor = color(255,255,0);
color backgroundColor = color(255,255,255);
color racketColor = color(255, 0, 0);
float ballY = 250; 
float ballX = 250;
color youLose = color(255, 0, 0);

void setup() {
  size(500, 500);
  ballX=500;
  ballY=50;
}

void initScreen() {
  background(0);
  textAlign(CENTER);
  fill(255,0,0);
  text("DON'T touch the bottom of the scren!!", height/2, width/2);
  text ("try to get 500 points to win bye using the red racket",250,300);
  text ("to move the ball to the yellow!!",250,350);
  text ("Click with mouse to start",250,400);
}
void gameScreen() {

  drawBall();
  applyGravity();
  keepInScreen();
  Horizontal();
  drawRacket();
  racketbounce();
    if (ballY<50)
  { score+=1; 
}
 if (score>=500)
  {
    youWin();
  }
 if (ballY>=450)
 {
   score -= 1000;
 }
 if (score<=-1)
 {
   youLose();
 }

}
  
void draw() {
  
  background(backgroundColor);
  noStroke();
  fill(rectColor);
  rect(0,0,1000,100);
  fill(0);
  text("score:" + score, 450, 100);

  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  }
  
}

void drawBall() 
{
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}



public void mousePressed() {
  
  if (gameScreen==0) {
    startGame();
  }
}
 
void startGame() {
  gameScreen=1;
}


//float ballX, ballY;
float ballSize = 40;




float airfriction = 0.000001;
float friction = 0.1;
float gravity = .25;
float ballSpeedVert = 0;

void applyGravity() {
  
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;

  ballSpeedVert -= (ballSpeedVert * airfriction);
}
void bounceBottom(float surface) {

  ballSpeedVert -= (ballSpeedVert * friction);
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
}
void bounceTop(float surface) {

  ballSpeedVert -= (ballSpeedVert * friction);
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
}



void youWin()
{
  backgroundColor = color(0);
 ballColor = color(0);
 rectColor = color(0);
 racketColor = color(0);
 youLose = color(0);
  fill(255,0,0);
  text("YOU WIN", width/2, height/2);

  
 }


 void youLose()
  { 
 backgroundColor = color(0);
 ballColor = color(0);
 rectColor = color(0);
 racketColor = color(0);
  fill(youLose);
  text("YOU LOSE   GAME OVER ", width/2, height/2);

}

float Height = 10;
float Width = 100;


void drawRacket(){
  fill(racketColor);
  rectMode(CENTER);
  rect(mouseX, mouseY, Width, Height);
}



float racketbounceRate = 10;


void racketbounce() {
  float overhead = mouseY - mouseY;
  if ((ballX+(ballSize/2) > mouseX-(Width/2)) && (ballX-(ballSize/2) < mouseX+(Width/2))) {
    if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)) {
      bounceBottom(mouseY);

      if (overhead<0) {
        ballY+=overhead;
        ballSpeedVert+=overhead;
      }
    }
}
}


float ballSpeedHorizon = 5;

void Horizontal(){
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}
void makeBounceLeft(float surface){
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
void makeBounceRight(float surface){
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

void keepInScreen() {
  
  if (ballX-(ballSize/2) < 0){
    makeBounceLeft(0);
  }
  if (ballX+(ballSize/2) > width){
    makeBounceRight(width);
  }
   if (ballY+(ballSize/2) > height) { 
    bounceBottom(height);
  }

  if (ballY-(ballSize/2) < 0) {
    bounceTop(0);
  }
}
