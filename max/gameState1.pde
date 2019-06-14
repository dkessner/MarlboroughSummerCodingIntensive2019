
void state2() {
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

  fill(0);
  ellipse(cw+1, ch-15, cr, cr);
  image(car, cw, ch);

  fill(0);
  ellipse(cw2+1, ch2-15, cr, cr);
  image(car2, cw2, ch2);


  if (dist(cw2, ch2, cw, ch) > 50) {
    file2.stop();   
    cw += cvx;
    ch += cvy;
  } else if (dist(cw2, ch2, cw, ch) < 75) {
    cw -= cvx;
    file2.play();
  }
  if (dist(cw, ch, cw2, ch2) > 50) {
    file2.stop();   
    cw2 += cvx2;
    ch2 += cvy2;
  } else if (dist(cw, ch, cw2, ch2) < 75) {
    cw2 -= cvx2;
    file2.play();
  }

  for (Cone c : cones)
  {
    if (dist(c.x, c.y, cw, ch) < 25) {
      file.play();
      gameState = 3;
      c.x = random((width*1/3)+30, (width*2/3)-30);
      c.y = random(-1, -700);

    }
  }

  for (Cone c : cones)
  {
    if (dist(c.x, c.y, cw2, ch2) < 25) {
      file.play();
      gameState = 2;
      c.x = random((width*1/3)+30, (width*2/3)-30);
      c.y = random(-1, -700);

    }
  }

  if (cw > (width*2/3) || cw < (width*1/3)) {
    cw = width/1.7;
  }

  if (cw2 > (width*2/3)|| cw2 < (width*1/3)) {
    cw2 = width/2.3;
  }
  
  if (ch < 0 || ch2 < 0){
    ch = height*5/7;
    ch2 = height*5/7;
  }
    if (ch > height || ch2 > height){
    ch = height*5/7;
    ch2 = height*5/7;
  }
}
