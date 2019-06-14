
void state4() {
  background(255);
  stroke(0);
  strokeWeight(10);
  line(width*2/3, 0, width*2/3, height);
  line(width*1/3, 0, width*1/3, height);
  Build();
    
  for (Cone c : cones) {
    c.update();
    c.display();
  } 
  
  cw +=cvx;
  ch +=cvy;

  fill(0);
  ellipse(cw+1, ch-15, cr, cr);
  image(car, cw, ch);

  for (Cone c : cones)
  {
    if (dist(c.x, c.y, cw, ch) < 25) {
      gameState = 5;
      c.x = random((width*1/3)+30, (width*2/3)-30);
      c.y = random(-1, -700);
      file.play();
    }
  }

  if (cw > (width*2/3) || cw < (width*1/3)) {
    cw = width/1.7;
  }
  
  if (ch < 0 || ch > height){
    ch = height*5/7;
  }

}
