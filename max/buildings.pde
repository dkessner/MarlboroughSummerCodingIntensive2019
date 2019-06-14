
void Build() 
{
  fill(#1BA545);
  rect(0, 0, width*1/3, height);
  rect(width*2/3, 0, width, height);
  
  fill(150);
  rect((width*1/3)-100, 0, 100, height);
  rect(width*2/3, 0, 100, height);
  
  fill(200);
  rect(width*1/3,0,width*1/3,height);

  noStroke();
  rect(50, 50, 150, 100);
  rect(50, 50, 100, 250);

  rect(50, 350, 250, 300);
  rect(200, 300, 100, 100);

  rect(1000, 500, 200, 200);
  rect(1200, 550, 50, 100);

  rect(1100, 50, 100, 200);
  rect(1000, 50, 100, 100);

  rect(1000, 300, 100, 150);
  rect(1100, 350, 200, 100);
}
