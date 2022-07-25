class Particle {
  PVector pos = new PVector(random(0, width), random(0, height));
  PVector vel = new PVector(0, 0);

  void show() {
    fill(255, 200);
    circle(pos.x, pos.y, 5);
  }
  
  void update() {
    pos.add(vel);
    vel.limit(5);
  }
  
  void apply(PVector force) {
    vel.add(force);
  }
}
