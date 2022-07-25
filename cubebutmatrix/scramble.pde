void scramble() {
  int s = (random(-1, 1) > 0) ? 1 : -1;
  int[] arr = {81, 65, 90, 87, 69, 82, 84, 71, 66};
  int k = arr[floor(random(0, arr.length))];
  turn(k, s, false);
}
