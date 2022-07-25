import peasy.*;

PeasyCam cam;
int dim = 3;
Baksa[][][] cube = new Baksa[dim][dim][dim];

final color UPP = #FFFFFF;
final color DWN = #FFFF00;
final color RGT = #FFA500;
final color LFT = #FF0000;
final color FRT = #00FF00;
final color BCK = #0000FF;

void setup() {
  size(700, 700, P3D);
  cam = new PeasyCam(this, 400);
  int len = 30;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        int offset = (dim-1) * len/2;
        int x = i * len - offset;
        int y = j * len - offset;
        int z = k * len - offset;
        cube[i][j][k] = new Baksa(x, y, z, len);
      }
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        cube[i][j][k].show();
      }
    }
  } 
}
