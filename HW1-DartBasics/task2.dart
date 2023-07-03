void main() {
    List<int> findIndexesGivesSum(List<int> array, int sum) {
        for (var i = 0; i < array.length; i++) {
            for (var j = 1; j < array.length; j++) {
                if (array[i] + array[j] == sum) {
                    return [i, j];
                }
            }
        }
        return [0, 0];
    }

    print(findIndexesGivesSum([1, 2, 3], 5)); // [1, 2];
    print(findIndexesGivesSum([8, 6, 5, 3], 2)); // [0, 0]
}
