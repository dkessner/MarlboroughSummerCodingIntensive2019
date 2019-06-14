ArrayList<Cone> cones;
PImage cone;
PImage car, car2, flags, explosion;
float cw, ch, cvx, cvy, cr, cw2, ch2, cvx2, cvy2, x, y;
int gameState;
import processing.sound.*;
SoundFile file;
import processing.sound.*;
SoundFile file2;

void setup() {

  file = new SoundFile(this, "Sound.mp3");
  file2 = new SoundFile(this, "Tires.mp3");

  //size(400, 400);
  fullScreen();
  cones = new ArrayList<Cone>();

  for (int i = 0; i < 20; i++) {
    Cone c = new Cone();
    cones.add(c);
  }

  loading();

  cw = width/1.7;
  ch = height*5/7;
  gameState = 0;
  cr = 10;
  cvx = 0;
  cvy = 0;
  cw2 = width/2.3;
  ch2 = height*5/7;
  cvx2 = 0;
  cvy2 = 0;
  x = random((width*1/3)+30, (width*2/3)-30);
  y = random(-900, -1);
}
void draw() {

  if (gameState == 0) { 
    file.stop();
    file2.stop();
    state1();
  }

  if (gameState == 1) {
    state2();
  }

  if (gameState == 2) {
    fill(0);
    text("GAME OVER", width/2, height/2.8);
    text("RED WINS", width/2, height/2.6);
    text("Press space to return to the title screen", width/2, height/2.3);
  }
  if (gameState == 3) {

    fill(0);
    text("GAME OVER", width/2, height/2.8);
    text("BLUE WINS", width/2, height/2.6);
    text("Press space to return to the title screen", width/2, height/2.3);
  }
  if (gameState == 4) {
    state4();
  }
  if (gameState == 5) {
    fill(0);
    textSize(20);
    text("GAME OVER", width/2, height/2.6);
    text("Press space to return to the title screen", width/2, height/2.3);
  }
  if (gameState == 6) {
    stateTwo();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) 
    cvx = 5;
  if (keyCode == LEFT) 
    cvx = -5;
  if (keyCode == UP) 
    cvy = -5;
  if (keyCode == DOWN) 
    cvy = 5;

  if (key == 'd') 
    cvx2 = 5;
  if (key == 'a') 
    cvx2 = -5;
  if (key == 'w') 
    cvy2 = -5;
  if (key == 's') 
    cvy2 = 5;


  if (keyCode == UP && gameState == 0) {
    gameState = 6;
  }

  if (keyCode == DOWN && gameState == 0) {    
    cw = width/1.7;
    cw2 = width/2.3;
    ch = height*5/7;
    ch2 = height*5/7;
    for (Cone c : cones) {
      c.x = random((width*1/3)+30, (width*2/3)-30);
      c.y = random(-700, -1);
    } 
    gameState = 4;
  }
  
  if (key == ' ' && gameState == 6) {
    cw = width/1.7;
    cw2 = width/2.3;
    ch = height*5/7;
    ch2 = height*5/7;
    for (Cone c : cones) {
      c.x = random((width*1/3)+30, (width*2/3)-30);
      c.y = random(-700, -1);
    } 
    gameState = 1;
  }

  if (key == ' ' && gameState == 2)
    gameState = 0;

  if (key == ' ' && gameState == 5)
    gameState = 0;

  if (key == ' ' && gameState == 3)
    gameState = 0;
}

void keyReleased() {

  if (keyCode == RIGHT)
    cvx = 0;
  if (keyCode == LEFT) 
    cvx = 0;
  if (keyCode == UP) 
    cvy = 0;  
  if (keyCode == DOWN) 
    cvy = 0;

  if (key == 'd') 
    cvx2 = 0;
  if (key == 'a') 
    cvx2 = 0;
  if (key == 'w') 
    cvy2 = 0;
  if (key == 's') 
    cvy2 = 0;
}
