float[][] rotationZ(float angle) {
  float z[][] = {
    { cos(radians(angle)), -sin(radians(angle)), 0},
    { sin(radians(angle)), cos(radians(angle)), 0},
    { 0, 0, 1}
  };
  return z;
};

float[][] rotationX(float angle) {
  float[][] x = {
    { 1, 0, 0},
    { 0, cos(radians(angle)), -sin(radians(angle))},
    { 0, sin(radians(angle)), cos(radians(angle))}
  };
  return x;
};

float[][] rotationY(float angle) {
  float[][] y = {
    { cos(radians(angle)), 0, sin(radians(angle))},
    { 0, 1, 0},
    { -sin(radians(angle)), 0, cos(radians(angle))}
  };
  return y;
};

float[][] matmul(float[][] a, float[][] b) {
  int colsA = a[0].length;
  int rowsA = a.length;
  int colsB = b[0].length;
  int rowsB = b.length;

  if (colsA != rowsB) {
    println("Columns of A must match rows of B");
    return null;
  }

  float result[][] = new float[rowsA][colsB];

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      float sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}

PVector matmul(PVector a, float[][] b) {
  return matrixToVec(matmul(vecToMatrix(a), b));
}

float[][] vecToMatrix(PVector v) {
  float[][] m = new float[1][3];
  m[0][0] = v.x;
  m[0][1] = v.y;
  m[0][2] = v.z;
  return m;
}

PVector matrixToVec(float[][] m) {
  PVector v = new PVector(m[0][0], m[0][1], m[0][2]);
  return v;
}

void logMatrix(float[][] m) {
  int cols = m[0].length;
  int rows = m.length;
  println(rows + "x" + cols);
  println("----------------");
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print(m[i][j] + " ");
    }
    println();
  }
  println();
}
