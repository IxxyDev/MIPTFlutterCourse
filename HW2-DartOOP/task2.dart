import 'dart:convert';

void main() {
  final me = UserModel('Yaroslav', 27, false, ['drink soda', 'scroll socials']);

  print(jsonEncode(me));
}

class UserModel {
  String name;
  int age;
  bool isAdmin;
  List<String> skills;

  UserModel(this.name, this.age, this.isAdmin, this.skills);
  
  Map<String, dynamic> toJson(UserModel model) {
    return {
      'name': name,
      'age': age,
      'isAdmin': isAdmin,
      'skills': skills,
    };
  }
}