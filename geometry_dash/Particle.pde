class Particle {
  PVector pos;
  int transparency = int(random(80, 100));
  Particle(float startX, float endX) {
    pos = new PVector(200, int(random(startX, endX)));
  }
  
  void show() {
    fill(210, transparency);
    square(pos.x, pos.y, 5);
  }
  
  void update() {
    pos.x -= 5;
  }
}
