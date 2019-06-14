
class Cone {
  float x, y, vx, vy, r; //, cw, ch, vcw, vch, ;

  Cone() {
    x = random((width*1/3)+30, (width*2/3)-30);
    y = random(-900, -1);
    vx = 0;
    vy = 5;
    r = 20;
  }  

  void update() {
    x = x + vx;
    y = y + vy;

    if (y > height) {
      y = random(-900, -1);
      x = random((width*1/3)+30, (width*2/3)-30);
    }
  }

  void display() {
    noStroke();
    fill(255, 0);
    ellipse(x, y, r, r);
    image(cone, x, y);
  }
}
