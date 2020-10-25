import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier {
  String _tempType = 'celcius';
  int _tempValue = 25;

  String get tempType => _tempType;

  int get tempValue => _tempValue;

  set tempType(String temp) {
    _tempType = temp;
    notifyListeners();
  }

  set tempValue(int value) {
    _tempValue = value;
    notifyListeners();
  }
}
