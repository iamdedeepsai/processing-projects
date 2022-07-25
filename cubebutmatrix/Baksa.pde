class Baksa {
  float[][] pos = new float[8][3];
  PVector p;
  int a = 0;
  int vA = 0;
  float[][] result = new float[8][3];
  float[][] iPos;
  boolean moving = false;
  color strok = #000000;
  
  Baksa(PVector pos_) {
    p = pos_;
    float offset = len/2;
    
    pos[0][0] = pos_.x * len - offset;
    pos[0][1] = pos_.y * len - offset;
    pos[0][2] = pos_.z * len - offset;
    
    pos[1][0] = (pos_.x + 1) * len - offset;
    pos[1][1] = pos_.y * len - offset;
    pos[1][2] = pos_.z * len - offset;
    
    pos[2][0] = (pos_.x + 1) * len - offset;
    pos[2][1] = pos_.y * len - offset;
    pos[2][2] = (pos_.z + 1) * len - offset;
    
    pos[3][0] = pos_.x * len - offset;
    pos[3][1] = pos_.y * len - offset;
    pos[3][2] = (pos_.z + 1) * len - offset;
    
    pos[4][0] = (pos_.x + 1) * len - offset;
    pos[4][1] = (pos_.y + 1) * len - offset;
    pos[4][2] = pos_.z * len - offset;
    
    pos[5][0] = pos_.x * len - offset;
    pos[5][1] = (pos_.y + 1) * len - offset;
    pos[5][2] = pos_.z * len - offset;
    
    pos[6][0] = pos_.x * len - offset;
    pos[6][1] = (pos_.y + 1) * len - offset;
    pos[6][2] = (pos_.z + 1) * len - offset;
    
    pos[7][0] = (pos_.x + 1) * len - offset;
    pos[7][1] = (pos_.y + 1) * len - offset;
    pos[7][2] = (pos_.z + 1) * len - offset;
  }
  
  void show() {
    push();
    strokeWeight(3);
    stroke(strok);
    beginShape(QUADS);    
    //top
    fill(TPP);
    vertex(pos[0]);
    vertex(pos[1]);
    vertex(pos[2]);
    vertex(pos[3]);
    
    //front
    fill(FRT);
    vertex(pos[3]);
    vertex(pos[2]);
    vertex(pos[7]);
    vertex(pos[6]);
    
    //left
    fill(LFT);
    vertex(pos[0]);
    vertex(pos[3]);
    vertex(pos[6]);
    vertex(pos[5]);
    
    //back
    fill(BCK);
    vertex(pos[0]);
    vertex(pos[1]);
    vertex(pos[4]);
    vertex(pos[5]);
     
    //right
    fill(RGT);  
    vertex(pos[1]);
    vertex(pos[2]);
    vertex(pos[7]);
    vertex(pos[4]);
    
    //down
    fill(DWN);
    vertex(pos[5]);
    vertex(pos[4]);
    vertex(pos[7]);
    vertex(pos[6]);
    endShape();
    
    pop();
  }
  
  void move() {
    if (moving) {
      cubeMoving = true;
      pos = matmul(pos, result);
      a += vA;
      
      if (a == 90 || a == -90) {
        a = 0;
        vA = 0;
        for (int i = 0; i < pos.length; i++) {
          pos[i][0] = round(pos[i][0]);
          pos[i][1] = round(pos[i][1]);
          pos[i][2] = round(pos[i][2]);
        }
        moving = false;
        cubeMoving = false;
      }
    }
  }
}

void vertex(float[] pos) {
  vertex(pos[0], pos[1], pos[2]);
}
