void main() {
 String intToRoman(int num) {
   List<int> arabics = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
   List<String> romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
      
   String result = '';
      
   for (int i = 0; i < arabics.length; i++) {
     while (num >= arabics[i]) {
      roman += romans[i];
      num -= arabics[i];
    }
   }
      
   return result;
  }
}
