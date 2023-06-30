void main() {
 String intToRoman(int num) {
   List<int> arabic = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
   List<String> roman = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
      
   String result = '';
      
   for (int i = 0; i < arabic.length; i++) {
     while (num >= arabic[i]) {
      result += roman[i];
      num -= arabic[i];
    }
   }
      
   return result;
  }
  
  print(intToRoman(943)); // CMXLIII
  print(intToRoman(3)); // III
}
