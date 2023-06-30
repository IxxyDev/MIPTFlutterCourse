void main() {
  Map<String, int> romanToArabic = {
    "null": 0,
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  };
  
  bool isLastChar(String s, int idx) {
    return idx == s.length - 1;
  }

  int romanToInt(String roman) {
    var result = 0;
    
    for (var i = 0; i < roman.length; i++) {
      int current = romanToArabic[roman[i]]!;
      int next = isLastChar(roman, i) ? 0 : romanToArabic[roman[i + 1]]!;
      
      if ((isLastChar(roman, i)) || (current >= next && next != 0)) {
        result += current;
      } else {
        result -= current;
      }
    }
    
    return result;
  }
  
  print(romanToInt("III")); // 3
  print(romanToInt("CCXIX")); // 219
  print(romanToInt("CDVII")); // 407
}