Ground g;
Player p;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
PImage bg;
boolean gameOver = false;

void setup() {
  size(1000, 600, P3D);
  g = new Ground();
  p = new Player(200, height - 100 - 50);
  bg = loadImage("bg.png");
  frameRate(120);
  Obstacle o = new Obstacle();
  obstacles.add(o);
  o = new Obstacle();
  o.pos.x = width += 300;
  obstacles.add(o);
}

void draw() {
  image(bg, 0, 0, 1200, 900);
  g.show();
  if (!gameOver) {
    p.show();
  }
  p.update();
  p.showParticles();
  
  if (mousePressed || keyPressed) {
    p.jump();
  }
  
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.show();
    o.update();
    o.checkHit(p);
    if (o.pos.x + o.num * 60 < 0) {
      Obstacle o1 = new Obstacle();
      obstacles.add(o1);
      obstacles.remove(i);
    }
  }
  
  if (gameOver) {
    fill(252, 186, 3, 100);
    rect(100, 100, 800, 400);
    textSize(30);
    text("Lmao you lost!", 375, height/2 - 10);
  }
}

void keyPressed() {
  p.jump();
}

void mousePressed() {
  p.jump();
}
