void main() {
  int findFirstUniqueNumber(List<int> array) {
    Map<int, int> numbersCount = {};

    for (var i = 0; i < array.length; i++) {
      if (!numbersCount.containsKey(array[i])) {
        numbersCount[array[i]] = 1;
      } else {
        numbersCount[array[i]] = numbersCount[array[i]]! + 1;
      }
    }

    for (var i = 0; i < numbersCount.keys.length; i++) {
      if (numbersCount[numbersCount.keys.elementAt(i)] == 1)
        return numbersCount.keys.elementAt(i);
    }

    return -1;
  }

  print(findFirstUniqueNumber([1, 2, 2, 3, 1])); // 3
  print(findFirstUniqueNumber([5, -1, -1])); // 5
  print(findFirstUniqueNumber([2, 2, 2])); // -1
}
