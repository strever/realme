import 'dart:math';

void main(List<String> args) {
  if (args.length > 0) {
    for (var item in args) {
      print("${item}");
    }
  }

  //Bicycle bicycle = new Bicycle(20);
  //var bicycle = Bicycle(20);
  //bicycle.setSpeed(50);
  //print(bicycle.toString());

  //var con = const Point(5,5);
  //print(con.x);
  print(Circle(2).area);
  print(Square(2).area);
  


  
}


class Bicycle {
  int speed;
  Bicycle(speed) {
    this.speed = speed;
    print("speed initialize to $speed");
  }

  setSpeed(int speed) {
    this.speed = speed;
    print("speed has been set to $speed");
  }

  String toString() {
    return "speed currently is ${this.speed}";
  }

}

abstract class Shape {
  num get area;
}

class Circle extends Shape {
  num radius;

  Circle(this.radius);

  num get area => pi * pow(this.radius, 2);
}

class Square extends Shape {
  num side;

  Square(this.side);

  num get area => pow(this.side, 2);
}