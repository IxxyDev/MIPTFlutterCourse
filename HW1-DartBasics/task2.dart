void main() {
  List<int> findIndexesGivesSum(List<int> array, int sum) {
    Map<int, int> map = {};
    map[array[0]] = 0;

    for (var i = 1; i < array.length; i++) {
      if (map.containsKey(sum - array[i])) {
        return [map[sum - array[i]]!, i];
      }

      map[array[i]] = i;
    }

    return [0, 0];
  }

  print(findIndexesGivesSum([1, 2, 3], 5)); // [1, 2];
  print(findIndexesGivesSum([1, 4, 45, 6, 10, -8], 11)); // [0, 4];
  print(findIndexesGivesSum([8, 6, 5, 3], 2)); // [0, 0]
}
