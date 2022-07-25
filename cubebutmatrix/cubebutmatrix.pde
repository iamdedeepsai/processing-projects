import peasy.*;
PeasyCam cam;
int len = 100;
int dim = 3;
Baksa[] baksas = new Baksa[27];
int selected = 6;
ArrayList<Step> steps = new ArrayList<Step>();
float aX = -30;
float aY = 45;
boolean cubeMoving = false;
boolean shifted = false;
boolean scrambling = false;
boolean redo = false;

final color TPP = #FFFFFF;
final color FRT = #0028FF;
final color LFT = #FF0015;
final color BCK = #03FF00;
final color RGT = #FF6600;
final color DWN = #F5FC29;

void setup() {
  size(1000, 800, P3D);
  //cam = new PeasyCam(this, 600);
  int ind = 0;
  for (int x = -1; x < 2; x++) {
    for (int y = -1; y < 2; y++) {
      for (int z = -1; z < 2; z++) {
        baksas[ind] = new Baksa(new PVector(x, y, z));
        ind++;
      }
    }
  }
}

int num = 0;
int r = 0;

void draw() {
  background(0);
  push();
  translate(width/2, height/2);
  rotateX(radians(-30));
  rotateY(radians(45));
  
  if (scrambling && num <= 400) {
    scramble();
    num++;
    scrambling = (num >= 400) ? false : true;
  }
  
  if (redo && r >= 0) {
    Step s = steps.get(r);
    turn(s.k, s.s, false);
    if (!cubeMoving) {
      r--;
    }
    if (r == -1) {
      steps = new ArrayList<Step>();
    }
  }
  
  for (int i = 0; i < baksas.length; i++) {
    Baksa b = baksas[i];
    b.strok  = (selected == i) ? #D40FFC : #000000;
    b.show();
    b.move();
  }
    
  pop();
}

void keyPressed() {
  shifted = (keyCode == 16) ? !shifted : shifted;
  int s = (shifted) ? -1 : 1;
  if (keyCode == 80) {
    redo = true;
    r = steps.size() - 1;
  }
  
  if (keyCode == 82) {
    for (int i = 0; i < baksas.length; i++) {
      Baksa b = baksas[i];
      b.p = matmul(b.p, rotationY(-90));
      b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
      b.pos = matmul(b.pos, rotationY(-90));
      for (int j = 0; j < b.pos.length; j++) {
        b.pos[j][0] = round(b.pos[j][0]);
        b.pos[j][1] = round(b.pos[j][1]);
        b.pos[j][2] = round(b.pos[j][2]);
      }
    }
  }
  
  if (keyCode == 85) {
    for (int i = 0; i < baksas.length; i++) {
      Baksa b = baksas[i];
      b.p = matmul(b.p, rotationX(180));
      b.p = matmul(b.p, rotationY(-90));
      b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
      b.pos = matmul(b.pos, rotationX(180));
      b.pos = matmul(b.pos, rotationY(-90));
      for (int j = 0; j < b.pos.length; j++) {
        b.pos[j][0] = round(b.pos[j][0]);
        b.pos[j][1] = round(b.pos[j][1]);
        b.pos[j][2] = round(b.pos[j][2]);
      }
    }
  }
  //turn(keyCode, s, true);
}
