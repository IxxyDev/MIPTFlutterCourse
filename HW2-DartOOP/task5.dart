import 'dart:io';

void main() {
  final ts = TimeService();
  print(ts.currentTime);
  sleep(const Duration(milliseconds: 10000));
  print(ts.currentTime); // should be same as previous;
}

class TimeService {
  String _currentTime = '';
  int _updatePeriodInSeconds = 60;
  final SECONDS_TO_MILLISECONDS_MULTIPLYER = 1000;
  DateTime _lastGetTime = DateTime.fromMillisecondsSinceEpoch(0);


  String get currentTime {
    final currentTime = DateTime.now();

    if (currentTime.microsecondsSinceEpoch - _lastGetTime.microsecondsSinceEpoch > 
    SECONDS_TO_MILLISECONDS_MULTIPLYER * _updatePeriodInSeconds) {
      _currentTime = DateTimeApiService.getCurrentTime().toString();
    }

    _lastGetTime = currentTime;

    return _currentTime;
  }

  set updatePeriodInSeconds(int seconds) {
    _updatePeriodInSeconds = seconds;
  }
}

class DateTimeApiService {
  static DateTime getCurrentTime() {
    print("got time");
    return DateTime.now();
  }
}