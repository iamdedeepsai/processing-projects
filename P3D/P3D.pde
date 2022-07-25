void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI/5, PI/5));
  rotateX(map(mouseY, 0, height, PI/5, -PI/5));
  box(200, 200, 200);
}
