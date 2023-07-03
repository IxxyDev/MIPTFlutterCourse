void main() {
  final testStorage = SmartStorage([NamedModel("John", 1), NamedModel("Jane", 2), NamedModel("Bill", 3), NamedModel("Jane", 4)]);

  testStorage.add(NamedModel("Nick", 5));
  print(testStorage.toString()); // { name: "John" }, { name: "Jane" }, { name: "Bill" }, { name: "Jane" }, { name: "Nick" }

  testStorage.remove(3);
  print(testStorage.toString()); // { name: "John" }, { name: "Jane" }, { name: "Jane" }, { name: "Nick" }

  print(testStorage.findAllByName("Jane").toString()); // { name: "Jane" }, { name: "Jane" }

  testStorage.removeAllByName("Jane");
  print(testStorage.toString()); // { name: "John" }, { name: "Bill" }, { name: "Nick" }
}

class NamedModel {
  String name;
  int id;

  NamedModel(this.name, this.id);
}

class SmartStorage<T extends NamedModel> {
  List<T> storage;

  SmartStorage(this.storage);

  void add(T element) {
    storage.add(element);
  }

  void remove(int id) {
    for (var i = 0; i < storage.length; i++) {
      if (id == storage[i].id) {
        storage.remove(storage[i]);
        break;
      }
    }
  }

  void removeAllByName(String name) {
    for (var i = 0; i < storage.length; i++) {
      if (name == storage[i].name) {
        storage.remove(storage[i]);
      }
    }
  }

  List<T> findAllByName(String name) {
    List<T> result = [];

    for (var i = 0; i < storage.length; i++) {
      if (name == storage[i].name) {
        result.add(storage[i]);
      }
    }
    
    return result;
  }

  @override
  String toString() {
    String result = '';

    for (var i = 0; i < storage.length - 1; i++) {
      result += '{ name: "${storage[i].name}" }, ';
    }

    result += '{ name: "${storage.last.name}" }';
    return result;
  }
}
