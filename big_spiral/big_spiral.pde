int[][] arr = new int[4][4];
String d = "DWN";
int x = 3;
int y = 0;

void setup() {
  size(200, 200);
   for (int i = 0; i < arr.length; i++) {
     for (int j = 0; j < arr.length; j++) {
       arr[i][j] = 0;
     }
   }
   arr[x][y] = 1;
   frameRate(5);
}
int s = 2;
void draw() {
  background(0);
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length; j++) {
      if (arr[i][j] > 0) {
        fill(235, 82, 52);
        square(i * 50, j * 50, 50);
      }
    }
  }
  if (y+1 <= 3 && arr[x][y+1] == 0 && d == "DWN") {
    y += 1;
    if (y == 3 || arr[x][y+1] == 1) {d = "LFT";}
  } else if (x-1 >= 0 && arr[x-1][y] == 0 && d == "LFT") {
    x -= 1;
    if (x == 0 || arr[x-1][y] == 1) {d = "UPP";}
  } else if (y-1 >= 0 && arr[x][y-1] == 0 && d == "UPP") {
    y -= 1;
    if (y == 0 || arr[x][y-1] == 1) {d = "RGT";}
  } else if (x+1 <= 3 && arr[x+1][y] == 0 && d == "RGT") {
    x += 1;
    if (x == 3 || arr[x+1][y] == 1) {d = "DWN";}
  }
  arr[x][y] = s;
  s += 1;
  //square(x * 20, y * 20, 20);
  /*if (s == 17) {
    for (int i = 0; i < 4; i++) {
      String ans = "";
      for (int j = 0; j < 4; j++) {
        ans += arr[j][i] + " ";
      }
      println(ans);
    }
  }*/
}
