void turn(int k, int s, boolean addStep) {
  int num = 0;

  for (int i = 0; i < baksas.length; i++) {
    Baksa b = baksas[i];
       
    if (!cubeMoving) {
      if (k == 81 && b.p.y == -1) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationY(5 * s);
        b.p = matmul(b.p, rotationY(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 65 && b.p.y == 0) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationY(5 * s);
        b.p = matmul(b.p, rotationY(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 90 && b.p.y == 1) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationY(5 * s);
        b.p = matmul(b.p, rotationY(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 87 && b.p.x == -1) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationX(5 * s);
        b.p = matmul(b.p, rotationX(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 69 && b.p.x == 0) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationX(5 * s);
        b.p = matmul(b.p, rotationX(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 82 && b.p.x == 1) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationX(5 * s);
        b.p = matmul(b.p, rotationX(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 84 && b.p.z == -1) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationZ(5 * s);
        b.p = matmul(b.p, rotationZ(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 71 && b.p.z == 0) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationZ(5 * s);
        b.p = matmul(b.p, rotationZ(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
      
      if (k == 66 && b.p.z == 1) {
        b.moving = true;
        b.vA = 5 * s;
        b.result = rotationZ(5 * s);
        b.p = matmul(b.p, rotationZ(90 * s));
        b.p.set(round(b.p.x), round(b.p.y), round(b.p.z));
        num++;
        if (num == 9 && addStep) {
          steps.add(new Step(-s, k));
        }
      }
    }
  }
}
