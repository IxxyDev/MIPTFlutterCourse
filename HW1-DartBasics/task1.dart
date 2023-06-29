void main() {
    int findFirstUniqueNumber(List<int> array) {
        return array.firstWhere((num) => array.indexOf(num) == array.lastIndexOf(num)) ?? -1;
    }

    print(findFirstUniqueNumber([1, 2, 2, 3, 1])); // 3
    print(findFirstUniqueNumber([5, -1, -1])); // 5
    print(findFirstUniqueNumber([2, 2, 2])); // -1
}
