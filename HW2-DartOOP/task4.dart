import 'dart:io';
import 'dart:isolate';

void main() async {
  await Isolate.run(infiniteCalculation);
  while (true) {
    print(DateTime.now());
    sleep(const Duration(milliseconds: 1000));
  }
}

void infiniteCalculation() {
  var time;
  while (true) {
   time = DateTime.now();
  }
}