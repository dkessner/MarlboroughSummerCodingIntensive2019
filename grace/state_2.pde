void draw2Lives()
 {
  //sun
  fill(#FAFA8D);
  stroke(#FAFA8D);
  ellipse(1300, 150, 200, 200);
  
  fill (0);
  textSize (20);
  textMode (CENTER);
  text ("Score: " + score, 1300, 150);
  
  //heart
  image (heart, 100, 75);
  image (heart, 150, 75);
  
  
  //gravity
  x += vx;
  vx += ax;
  y += vy;
  vy += ay;
  
  if (y>800)
  {
    y = 800;
  }
  
  //water
  stroke(0);
  fill(#28A6E8);
  rect(0, 800, width, 100);
  
  //lilypads
  image (lilyPad, 100, 850);
  image (lilyPad, 300, 850);
  image (lilyPad, 700, 850);
  image (lilyPad, 900, 850);
  image (lilyPad, 1200, 850);

  //frog
  ellipse(x, y, frogRadius, frogRadius);
  image (frog, x, y);
  if (x> width-r || x<r)
    vx = -vx;
  if (y> width-r || y<r)
    vy = -vy;  
  
  for (Fly f : flies)
  {
    f.update();
    f.display();
  }

  for (Fly f : flies)
  {
    if (dist(f.fx, f.fy, x, y) < 20)
    {
      f.fx = random(25, 1275);
      f.fy = random(25, 250);
      score += 50;
    }
  }
  
  for (Fly f : flies)
  {
    if (f.fy > 800)
     {
       f.fy = random (-1, -100);
       f.fx = random (1, 1250);
       score -= 50;
     }
  }
    
  for (Ladybug l : ladybugs)
  {
    l.update();
    l.display();
  }

  for (Ladybug l : ladybugs)
  {
    if (dist(l.lx, l.ly, x, y) < 20)
    {
      l.lx = random(25, 1275);
      l.ly = random(25, 250);
      score -= 50;
    }
  }
  
  for (Ladybug l : ladybugs)
  {
    if (l.ly > 800)
     {
       l.ly = random (-1, -100);
       l.lx = random (1, 1250);
     }
  }
  
  if (dist(x, y, 200, 850) < 75)
  {
    splash.play();
    state = 3;
    x = 100;
    y = 850;
  }
  
  if (dist(x, y, 400, 850) < 75)
  {
    splash.play();
    state = 3;
    x = 100;
    y = 850;
  }
  
  if (dist(x, y, 600, 850) < 100)
  {
    splash.play();
    state = 3;
    x = 100;
    y = 850;
  }
  
 if (dist(x, y, 800, 850) < 100)
  {
    splash.play();
    state = 3;
    x = 100;
    y = 850;
  }
  
 if (dist(x, y, 1000, 850) < 75)
  {
    splash.play();
    state = 3;
    x = 100;
    y = 850;
  }
  
 if (dist(x, y, 1100, 850) < 75)
  {
    splash.play();
    state = 3;
    x = 100;
    y = 850;
  }
  
  if (score >= 300)
  {
    win.play();
    state = 5;
    x = 100;
    y = 850;
  }
 }