class Block {
  PVector pos;
  int c[] = new int[3];
  
  void var(PVector p, int r, int g, int b) {
    pos = p;
    c[0] = r;
    c[1] = g;
    c[2] = b;
  }
  
  void show() {
    fill(c[0], c[1], c[2], 100);
    rect(pos.x, pos.y, 160, 50, 3);
  }
  
  boolean checkHit(Ball b) {
    if (b.pos.x > pos.x - 10 && b.pos.x < pos.x + 170 && b.pos.y > pos.y - 10 && b.pos.y < pos.y + 60) {
      return true;
    }
    return false;
  }
}
