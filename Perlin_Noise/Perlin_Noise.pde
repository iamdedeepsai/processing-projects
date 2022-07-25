int w = 3000;
int l = 3000;
int scl = 25;
float flying = 0.0;
int[][] terrain = new int[w/scl][l/scl];
import java.awt.Robot;
Robot robot;
PVector mouse;
PImage img;

void setup() {
  fullScreen(P3D);
  frameRate(200);
  mouse = new PVector(width/2, height/2);
  try {
    robot = new Robot();
  } catch(Throwable e) {}
  img = loadImage("crosshair.png");
}

void draw() {
  noCursor();
  mouse.add(new PVector(mouseX - width/2, mouseY - height/2));
  background(66, 200, 245);
  
  flying -= 0.1;
  float yoff = 0.0;
  for (int x = 0; x < w/scl; x++) {
    float xoff = flying;
    for (int y = 0; y < l/scl; y++) {
      terrain[x][y] = int(map(noise(xoff, yoff), 0.0, 1.0, -10, 100));
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  translate(width/2, height/2);
  stroke(0, 255);
  strokeWeight(5);
  line(0, -20, 200, 0, 20, 200);
  line(-20, 0, 200, 20, 0, 200);
  //image(img, width/2, height/2, 100, 100);
  rotateX(map(mouse.y, -height/2, height/2, PI/3, PI/5));
  rotateZ(map(mouse.x, -width/2, width/2, 0, -TWO_PI));
  
  translate(-w/2, -l/2);
  
  noStroke();
  
  for (int y = 0; y < l/scl - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    int r = 87;
    int g = 245;
    int b = 66;
    for (int x = 0; x < w/scl; x++) {
      float shade = map(terrain[x][y], -10, 100, 150, 255)/255;
      fill(r * shade, g * shade, b * shade);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    
    endShape();
  }
  
  robot.mouseMove(width/2, height/2);
  //camera(100, 100, 500, 0, 0, 0, 1, 1, 1);
}
