class Baksa {
  int len;
  PVector pos;
  
  Baksa(int x, int y, int z, int len_) {
    pos = new PVector(x, y, z);
    len = len_;
  }
  
  void show() {
    fill(255);
    strokeWeight(5);
    stroke(0);
    push();
    translate(pos.x, pos.y, pos.z);
    beginShape(QUADS);
    float r = len / 2;

    // z-fixed
    fill(BCK);
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(-r, r, -r);

    fill(FRT);
    vertex(-r, -r, r);
    vertex(r, -r, r);
    vertex(r, r, r);
    vertex(-r, r, r);

    // y-fixed
    fill(DWN);
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, -r, r);
    vertex(-r, -r, r);

    fill(UPP);
    vertex(-r, r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(-r, r, r);

    // x-fixed
    fill(LFT);
    vertex(-r, -r, -r);
    vertex(-r, r, -r);
    vertex(-r, r, r);
    vertex(-r, -r, r);

    fill(RGT);
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(r, -r, r);

    endShape();
    pop();
  }
}
