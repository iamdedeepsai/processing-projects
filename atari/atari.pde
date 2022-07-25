Player p;
Ball b;
ArrayList<Block> blocks = new ArrayList<Block>();
int balls = 5;

void setup() {
  fullScreen();
  p = new Player();
  b = new Ball();
  frameRate(360);
  for (int i = 4; i < 9; i += 1) {
    for (int j = 0; j < 1920; j += 175) {
      Block b = new Block();
      PVector p = new PVector(j, i * 60);
      b.var(p, floor(random(0, 255)), floor(random(0, 255)), floor(random(0, 255)));
      blocks.add(b);
    }
  }
}

void draw() {
  background(0);
  p.show();
  b.move(p);
  b.show();
  for (int i = 0; i < blocks.size(); i += 1) {
    Block blok = blocks.get(i);
    blok.show();
    if (blok.checkHit(b)) {
      blocks.remove(i);
      b.vel.y *= -1;
      b.s += 0.25;
    }
  }
  fill(255);
  text("Balls: " + balls, 30, 30);
  if (b.pos.y > height) {
    balls -= 1;
    b.pos = new PVector(width/2, height/2);
  }
  
  if (blocks.size() == 0) {
    exit();
  }
}
