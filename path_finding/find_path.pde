void findPath() {
  Integer[] last = {0, 0};
  
  if (spaces.size() >= 2) {
    last = spaces.get(spaces.size() - 2);
  }
  
  boolean looping = true;
  for (int i = 0; i < 20; i++) {
    ArrayList<Integer> a = new ArrayList<Integer>();
    ArrayList<Integer> b = new ArrayList<Integer>();
    for (int j = 0; j < i*2; j++) {
      if (spaces.size() > i*2) {
        if (j < i) {
          a.add(spaces.get(spaces.size() - j - 1)[0]);
          a.add(spaces.get(spaces.size() - j - 1)[1]);
        } else {
          b.add(spaces.get(spaces.size() - j - 1)[0]);
          b.add(spaces.get(spaces.size() - j - 1)[1]);
        }
      }
    }
    for (int k = 0; k < a.size(); k++) {
      if (a.get(k) != b.get(k)){
        looping = false;
      }
    }
  }
  
  if (looping && spaces.size() > 8) {
    println(looping);
  }
  
  if (looping) {
    if (x <= 28 && grid[x + 1][y] == 0 && last[0] != x + 1 && !ifBeen(new Integer[]{x+1, y})) {
      x += 1;
    } else if (y <= 18 && grid[x][y + 1] == 0 && last[1] != y + 1 && !ifBeen(new Integer[]{x, y+1})) {
      y += 1;
    } else if (x >= 1 && grid[x -1][y] == 0 && last[0] != x - 1 && !ifBeen(new Integer[]{x-1, y})) {
      x -= 1;
    } else if (y >= 1 && grid[x][y-1] == 0 && last[1] != y - 1 && !ifBeen(new Integer[]{x-1, y})) {
      y -= 1;
    } else if (x <= 28 && grid[x + 1][y] == 0 && last[0] != x + 1) {
      x += 1;
    } else if (y <= 18 && grid[x][y + 1] == 0 && last[1] != y + 1) {
      y += 1;
    } else if (x >= 1 && grid[x -1][y] == 0 && last[0] != x - 1) {
      x -= 1;
    } else if (y >= 1 && grid[x][y - 1] == 0 && last[1] != y - 1) {
      y -= 1;
    }
  } else {
    if (y <= 18 && grid[x][y + 1] == 0 && last[1] != y + 1 && !ifBeen(new Integer[]{x, y+1})) {
      y += 1;
    } else if (x <= 28 && grid[x + 1][y] == 0 && last[0] != x + 1 && !ifBeen(new Integer[]{x+1, y})) {
      x += 1;
    } else if (y >= 1 && grid[x][y - 1] == 0 && last[1] != y - 1 && !ifBeen(new Integer[]{x, y-1})) {
      y -= 1;
    } else if (x >= 1 && grid[x -1][y] == 0 && last[0] != x - 1 && !ifBeen(new Integer[]{x-1, y})) {
      x -= 1;
    } else if (y <= 18 && grid[x][y + 1] == 0 && last[1] != y + 1) {
      y += 1;
    } else if (x <= 28 && grid[x + 1][y] == 0 && last[0] != x + 1) {
      x += 1;
    } else if (y >= 1 && grid[x][y - 1] == 0 && last[1] != y - 1) {
      y -= 1;
    } else if (x >= 1 && grid[x -1][y] == 0 && last[0] != x - 1) {
      x -= 1;
    }
  }
  
  spaces.add(new Integer[]{x, y});
}

boolean ifBeen(Integer[] space) {
  for (int i = 0; i < int(spaces.size()/3); i++) {
    if (space[0] == spaces.get(i)[0] && space[1] == spaces.get(i)[1]) {
      return true;
    }
  }
  return false;
}
