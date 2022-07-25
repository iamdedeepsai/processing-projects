int[][] grid;
int cols, rows;
int resolution = 10;
boolean start = false;

void setup() {
  fullScreen();
  cols = width / resolution;
  rows = height / resolution;
  grid = new int[cols][rows];
}

void draw() {
  background(0);
  
  if (mousePressed) {
    int x = floor(mouseX / resolution);
    int y = floor(mouseY / resolution);
    
    grid[x][y] = 1;
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      if (grid[i][j] == 1) {
        fill(255);
        stroke(0);
        rect(x, y, resolution - 1, resolution - 1);
      }
    }
  }
  
  if (start) { 
    int[][] next = new int[cols][rows];
  
    // Compute next based on grid
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int state = grid[i][j];
        // Count live neighbors!
        int neighbors = countNeighbors(grid, i, j);
  
        if (state == 0 && neighbors == 3) {
          next[i][j] = 1;
        } else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
          next[i][j] = 0;
        } else {
          next[i][j] = state;
        }
  
      }
    }
  
    grid = next;
  }
}


int countNeighbors(int [][]grid, int x, int y) {
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int col = (x + i + cols) % cols;
      int row = (y + j + rows) % rows;
      sum += grid[col][row];
    }
  }
  sum -= grid[x][y];
  return sum;
}

void mouseReleased() {
  start = true;
}
