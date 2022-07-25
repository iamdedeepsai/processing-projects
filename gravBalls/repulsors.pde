class Repulsor {
  PVector pos;
  Repulsor(float x, float y) {
    pos = new PVector(x, y);
  }

  void show() {
    fill(255, 25, 25);
    noStroke();
    circle(pos.x, pos.y, 30);
  }
  
  void repel(Particle p) {
    float d = dist(pos.x, pos.y, p.pos.x, p.pos.y);
    d = (50 * 5) / (d * d);
    d = constrain(d, 0, 0.01);
    PVector gravitationalPull = new PVector(pos.x, pos.y);
    PVector a = new PVector(p.pos.x, p.pos.y);
    gravitationalPull.sub(a);
    gravitationalPull.setMag(-d/5);
    p.apply(gravitationalPull);
  }
}
