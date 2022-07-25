ArrayList<Attractor> attractors = new ArrayList<Attractor>();
ArrayList<Repulsor> repulsors = new ArrayList<Repulsor>();
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  //size(600, 400);
  fullScreen();
  for (int i = 0; i < 3000; i++) {
    Particle p = new Particle();
    particles.add(p);
  }
}

void draw() {
  background(0);
  stroke(255);
  line(width/2 - 400, height/2, width/2 + 400, height/2);
  line(width/2, height/2 - 200, width/2, height/2 + 200);
  
  noStroke();
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    p.show();
  }
  
  for (int i = 0; i < attractors.size(); i++) {
    Attractor a = attractors.get(i);  
    a.show();
    for (int j = 0; j < particles.size(); j++) {
      Particle p = particles.get(j);
      a.attract(p);
    }
  }
  
  for (int i = 0; i < repulsors.size(); i++) {
    Repulsor r = repulsors.get(i);
    r.show();
    for (int j = 0; j < particles.size(); j++) {
      Particle p = particles.get(j);
      r.repel(p);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {  
    Attractor a = new Attractor(mouseX, mouseY);
    for (int j = 0; j < attractors.size(); j++) {
      Attractor b = attractors.get(j);
      if (attractors.size() > 0 && dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y) <= 50) {
        return;
      }
    }
    attractors.add(a);
  } else if (mouseButton == RIGHT) {
    Repulsor a = new Repulsor(mouseX, mouseY);
    for (int j = 0; j < repulsors.size(); j++) {
      Repulsor b = repulsors.get(j);
      if (repulsors.size() > 0 && dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y) <= 30) {
        return;
      }
    }
    repulsors.add(a);
  }
}                
