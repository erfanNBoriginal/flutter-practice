class Car {
  //
  static const numberOfWheels = 4;

  String name;

  String vendor;

  String color;

  int model;

  int speed = 0;

  int maxSpeed;

  Car({
    required this.name,
    required this.vendor,
    required this.color,
    required this.model,
    required this.maxSpeed,
  });

  Car.irani({
    required this.name,
    required this.vendor,
    required this.color,
    required this.model,
    this.maxSpeed = 0,
  });

  void gazver(int value) {
    var temp = speed + value;
    if (temp <= maxSpeed) {
      speed = temp;
    } else {
      speed = maxSpeed;
    }
    print('speed: $speed');
  }

  void tormozEla(int value) {
    var temp = speed - value;
    if (temp < 0) {
      speed = 0;
    } else {
      speed = temp;
    }
    print('speed: $speed');
  }

  Map toMap() {
    return {
      "Name": name,
      "vendor": vendor,
      "color": color,
      "model": model,
      "speed": speed,
      "maxSpeed": maxSpeed,
    };
  }
}
