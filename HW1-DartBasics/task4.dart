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

  int romanToInt(String roman) {
    var res = 0;

    for (var i = 0; i < roman.length; i++) {
      String current = roman[i];
      String next = i < roman.length - 1 ? roman[i + 1] : "null";
      
      if (romanToArabic[current]! < romanToArabic[next]!) {
        res -= romanToArabic[roman[i]]!;
      } else {
        res += romanToArabic[roman[i]]!;
      }
    }
    return res;
  }
  
  print(romanToInt("III")); // 3
  print(romanToInt("CCXIX")); // 219
}