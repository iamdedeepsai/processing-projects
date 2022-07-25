class Player{
  PVector pos;
  PVector vel;
  PVector g;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  Player(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    g = new PVector(0, 0.2);
    for (int i = 0; i < 3; i++) {
      Particle p = new Particle(pos.y, pos.y + 50);
      particles.add(p);
    }
  }
  
  void show() {
    pos.add(vel);
    if (pos.y >= height - 150) {
      pos.y = height - 150;
    }
    fill(224, 16, 50);
    noStroke();
    square(pos.x, pos.y, 50);
  }
  
  void showParticles() {
    if (frameCount % 10 == 0) {
      for (int i = 0; i < 3; i++) {
        Particle p = new Particle(pos.y, pos.y + 50); 
        particles.add(p);
      }
    }
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.show();
      p.update();
      if (p.pos.x < 0) {
        particles.remove(i);
      }
    }
  }
  
  void update() {
    vel.add(g);
  }
  
  void jump() {
    if (pos.y > 0) {
      vel.y = -8;
    }
  }
}
