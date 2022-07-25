ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  fullScreen();
  for (int i = 0; i < 1000; i++) {
    Particle p = new Particle();
    particles.add(p);
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    p.show();
    attract(p);
  }
}

void attract(Particle p) {
  float d = dist(mouseX, mouseY, p.pos.x, p.pos.y);
  d = (50 * 5) / (d * d);
  d = constrain(d, 0, 0.1);
  PVector gravitationalPull = new PVector(mouseX, mouseY);
  PVector a = new PVector(p.pos.x, p.pos.y);
  gravitationalPull.sub(a);
  gravitationalPull.setMag(-d);
  p.apply(gravitationalPull);
}
