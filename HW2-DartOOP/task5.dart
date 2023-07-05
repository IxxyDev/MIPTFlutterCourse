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
  static const _kSedondsToMillisecondsMultiplyer =
      1000; //const без static нельзя; потому был final
  DateTime _lastGetTime = DateTime.fromMillisecondsSinceEpoch(0);

  String get currentTime {
    final currentTime = DateTime.now();

    if (currentTime.microsecondsSinceEpoch -
            _lastGetTime.microsecondsSinceEpoch >
        _kSedondsToMillisecondsMultiplyer * _updatePeriodInSeconds) {
      _currentTime = DateTimeApiService.getCurrentTime().toString();
    }

    _lastGetTime = currentTime;

    return _currentTime;
  }

  set updatePeriodInSeconds(int seconds) {
    if (seconds > 0) {
      _updatePeriodInSeconds = seconds;
    }
  }
}

class DateTimeApiService {
  static DateTime getCurrentTime() {
    print("got time");
    return DateTime.now();
  }
}
