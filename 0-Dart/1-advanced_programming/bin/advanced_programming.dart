import 'package:advanced_programming/abstract.dart';
import 'package:advanced_programming/car.dart';
import 'package:advanced_programming/truck.dart';

void main() {
  //
  var corolla = Car(
    name: 'Corolla',
    vendor: 'Toyota',
    color: 'Blue',
    model: 1996,
    maxSpeed: 220,
  );

  var pride = Car.irani(
    name: 'pride',
    vendor: 'saypa',
    color: 'white',
    model: 1397,
  );

  print(corolla.toMap());
  corolla.gazver(20);
  print(corolla.toMap());
  corolla.gazver(60);
  print(corolla.toMap());
  corolla.gazver(60);
  print(corolla.toMap());
  corolla.gazver(60);
  print(corolla.toMap());
  corolla.gazver(60);
  print(corolla.toMap());
  corolla.gazver(60);
  print(corolla.toMap());
  corolla.gazver(60);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());
  corolla.tormozEla(40);
  print(corolla.toMap());

  var fh12 = Truck(
    name: 'FH12',
    vendor: 'Volvo',
    model: 2020,
    color: 'white',
    maxSpeed: 120,
    maxTonage: 24,
    engineCc: 4500,
  );

  //==================Truck==================

  print('fh12.toMap()');
  print(fh12.toMap());

  fh12.bargiri(6);
  print(fh12.toMap());
  fh12.gazver(60);
  print(fh12.toMap());
  fh12.tormozEla(80);
  print(fh12.toMap());
  fh12.bargiri(20);
  print(fh12.toMap());
  fh12.gazver(60);
  print(fh12.toMap());

  fh12.name = 'pride';

  fh12.engineCc = 10000;
  print(fh12.toMap());

  fh12.engineCc = 20000;
  print('fh12.toMap()');
  print(fh12.toMap());

  //===============Abstract Class=============

  print('Car.numberOfWheels');
  print(Car.numberOfWheels);

  print('Theme.isDark');
  print(Theme.isDark);

  Theme.changeTheme(true);

  print('Theme.isDark');
  print(Theme.isDark);
}
