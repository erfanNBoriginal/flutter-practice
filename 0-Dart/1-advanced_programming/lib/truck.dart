import 'package:advanced_programming/car.dart';

class Truck extends Car {
  //
  int currentTonage = 0;

  int maxTonage;

  int _engineCc = 0;

  int _engineChangeIndex = 0;

  int get engineCc {
    return _engineCc;
  }

  set engineCc(int value) {
    if (_engineChangeIndex == 0) {
      _engineChangeIndex = _engineChangeIndex + 1;
      _engineCc = value;
    } else {
      throw Exception('You cant change engine again!');
    }
  }

  bool get checkWarning {
    if (currentTonage > maxTonage) {
      return true;
    } else {
      return false;
    }
  }

  Truck({
    required super.name,
    required super.vendor,
    required super.color,
    required super.model,
    required super.maxSpeed,
    required this.maxTonage,
    required int engineCc,
  }) {
    _engineCc = engineCc;
  }

  @override
  void gazver(int value) {
    if (checkWarning) {
      //
    } else {
      super.gazver(value);
    }
  }

  // current set

  void bargiri(int ton) {
    if (speed == 0) {
      currentTonage = currentTonage + ton;
    }
  }

  void takhliyeBar(int ton) {
    if (speed == 0) {
      var temp = currentTonage - ton;
      if (temp < 0) {
        currentTonage = 0;
      } else {
        currentTonage = temp;
      }
    }
  }

  // bool checkWaring() {
  //   if (currentTonage > maxTonage) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Map toMap() {
    var superMap = super.toMap();
    return {
      ...superMap,
      "currentTonage": currentTonage,
      'maxTonage': maxTonage,
      "engineCc": _engineCc,
      "tonageWarning": checkWarning,
    };
  }
}
