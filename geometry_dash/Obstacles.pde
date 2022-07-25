class Obstacle {
   int num = int(random(1, 5));
   PVector pos = new PVector(width, height - 150);
   
   void show() {
     for (int i = 0; i < num; i++) {
       fill(0);
       triangle(pos.x + i * 60, 500, pos.x + (i+1) * 60, 500, pos.x + i * 60 + 30, 450);
     }
   }
   
   void update() {
     pos.x -= 5;
   }
   
   void checkHit(Player p) {
     if (p.pos.x > pos.x && p.pos.x < pos.x + num * 60 && p.pos.y >= height - 150) {
       gameOver = true;
     }
   }
}
