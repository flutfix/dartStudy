import 'dart:math';

void main() {
  //Task 1
  String helloWorld = 'Hello World';

  changeWordOrder(string: helloWorld);
  ///////////////////////////////////////////////
  //Task 2
  List<int> numbers = [10, 20, 30];

  print('Task 2: ${middleSum(list: numbers)}');
  ///////////////////////////////////////////////

  //Task 4

  // Корней нет
  int a = 1;
  int b = 2;
  int c = 5;

  // 1 корень
  // int a = 4;
  // int b = -4;
  // int c = 1;

  // 2 корня
  // int a = 1;
  // int b = 2;
  // int c = -48;

  print('Task4: ${task4(a: a, b: b, c: c)}');
  ///////////////////////////////////////////////
}

//Task 1
void changeWordOrder({required String string}) {
  var a = string.split(' ');
  string = '';
  for (int i = a.length - 1; i >= 0; i--) {
    string += a[i];
    i != 0 ? string += ' ' : null;
  }
  print('Task 1: $string');
}

//Task 2
double middleSum({required List<int> list}) {
  double sum = 0;
  list.forEach((element) {
    sum += element;
  });
  sum /= list.length;
  return sum;
}

// Task 4
String task4({required int a, required int b, required int c}) {
  var d;
  var x1;
  var x2;

  void descriminant() {
    d = b * b - 4 * a * c;
  }

  void roots() {
    x1 = (-b + sqrt(d)) / (2 * a);
    x2 = (-b - sqrt(d)) / (2 * a);
  }

  descriminant();
  roots();

  if (d < 0) {
    return 'Нет корней';
  } else if (x1 == x2) {
    return 'X = $x1';
  } else {
    return 'X1= $x1, X2= $x2';
  }
}
