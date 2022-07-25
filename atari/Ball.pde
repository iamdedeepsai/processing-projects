class Ball {
  PVector pos = new PVector(width/2, height/2);
  float s = 7;
  PVector vel = new PVector(5, 5).setMag(s);
  
  void move(Player p) {
    if (p.pos.x < pos.x - 10 && pos.x < p.pos.x + 260 && pos.y >= height - 30) {
      vel.y *= -1;
      float a = map(pos.x - p.pos.x - 125, -125, 125, 135, 45);
      vel.x = cos(radians(a)) * s;
      vel.y = -sqrt(s*s - vel.x*vel.x);
    } else if (pos.x >= width - 10 || pos.x <= 10) {
      vel.x *= -1;
    } 
    if (pos.y <= 10) {
      vel.y *= -1;
    }
    pos.add(vel);
  }
  
  void show() {
    noStroke();
    fill(180);
    circle(pos.x, pos.y, 20);
  }
  
}
