void main() {
  int findNod(int a, int b) {
   return b == 0 ? a : findNod(b, a % b);
  }

  print(findNod(45, 81)); // 9
  print(findNod(1, 100)); // 1
  print(findNod(3, 0)); // 3
}