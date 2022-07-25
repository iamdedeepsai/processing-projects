int[][] grid = new int[30][20];
int x = 0;
int y = 0;
ArrayList<Integer[]> spaces = new ArrayList<Integer[]>();
void setup() {
  size(1200, 800);
  frameRate(5);
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 20; j++) {
      int n = int(random(100));
      if (n > 80) {
        grid[i][j] = 1;
      }
    }
  }
  grid[0][0] = 0;
  grid[29][19] = 0;
  spaces.add(new Integer[]{0, 0});
}

void draw() {
  background(0);
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 20; j++) {
      if (grid[i][j] == 1) {
        fill(255);
        square(i * 40, j * 40, 40);
      }
    }
  }
  
  fill(70, 235, 52);
  for (int i = 0; i < spaces.size(); i++) {
    Integer[] pos = spaces.get(i);
    square(pos[0] * 40, pos[1] * 40, 40);
  }
  fill(235, 73, 52);
  square(x * 40, y * 40, 40);
  if (x != 29 || y != 19) {
    findPath();
  } else {
    
  }
  
}
