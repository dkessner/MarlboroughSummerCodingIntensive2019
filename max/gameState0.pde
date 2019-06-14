
void state1() {

  file.stop();
  background(255);
//  image(explosion,width/2,height/2);
  image(flags, width/2, height/2);

  fill(0);
  rect((width/2)-200, (height/2)-150, 400, 125);
  
  strokeWeight(10);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("CRASH CONES", width/2, height/2.8);
  textSize(25);
  text("Click 'UP' for two player", width/2, height/2.4);
  text("Click 'DOWN' for single player", width/2, height/2.2);

}
