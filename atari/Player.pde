class Player {
  PVector pos = new PVector(width/2, height - 20);
  
  void show() {
    pos.x = constrain(mouseX - 125, 0, width - 250);
    fill(211);
    noStroke();
    rect(pos.x, pos.y, 250, 20);
  }
  
}
