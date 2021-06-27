void main() {
  // Task 1

  print('Task 1');
  final student = Student(
      firstName: 'Roman',
      lastName: 'Kolesov',
      yearOfAdmission: DateTime(2019, 9, 23));
  student.getCurrentCourse;
  print(student.toString());

  // Task 2
  print('Task 2');
  final Truck truck = Truck(color: Colors.blue);
  print(truck.toString());
  truck.run();
  final Sportcar sportcar = Sportcar(color: Colors.red);
  sportcar.run();

  // Task 3
  print('\nTask 3');
  final Generics generics = Generics(value: truck.enginePower);
  print(generics.convertToString());
}

/* Task 1
Реализуйте класс Student (Студент), который будет наследоваться от класса User. Класс должен иметь следующие свойства:
yearOfAdmission:DateTime (год поступления в вуз): инициализируется в конструкторе
currentCourse:int (текущий курс): рассчитывается след. образом - из текущего года вычесть год поступления. чтобы получить годы из DateTime, воспользуйтесь свойством DateTime.year
Класс должен иметь метод toString() , с помощью которого можно вывести:
1) имя и фамилию студента - используя родительскую реализацию toString
2) год поступления
3) текущий курс */

class User {
  User({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;

  @override
  String toString() => '$firstName $lastName';
}

class Student extends User {
  Student({
    required String firstName,
    required String lastName,
    required this.yearOfAdmission,
  }) : super(firstName: firstName, lastName: lastName);

  final DateTime yearOfAdmission;
  int currentCourse = 0;

  int get getCurrentCourse {
    currentCourse = (DateTime.now().year - yearOfAdmission.year).toInt();

    if (currentCourse == 0) {
      currentCourse = 1;
    } else if (currentCourse < 0) {
      currentCourse = 0;
    } else if (currentCourse > 0 &&
        DateTime.now().month > yearOfAdmission.month.toInt()) {
      currentCourse += 1;
    }
    return currentCourse;
  }

  @override
  String toString() {
    var result = super.toString();
    ;
    result +=
        '\nYear Of Admission: ${yearOfAdmission.year.toString()}\nCurrent Course: ${currentCourse.toString()}\n';

    return result;
  }
}

/* Task 2
Есть базовый класс Car, с базовыми свойствами для всех машин
И есть велосипед
Велосипеды и автомобили являются разными видами транспорта, с различными свойствами. Но, и велосипед и автомобили можно покрасить краской!
Необходимо написать миксин, устанавливающий на выбор один из трех цветов для транспортного средства:
1) Создайте enum Colors с цветами red, green, blue
2) Создайти миксин Painter с свойством colorName:String и методом setColor(Colors color). В зависимости от значения enum, метод устанавливает название цвета 'red', 'green', 'blue'
3) Примените миксин к транспортным средствам и инициализируйте покраску в конструкторе класса.
4) Переопределите метод toString, чтобы он выводил "Грузовик color_name цвета"
Транспортные средства, наследуемые от класса Car приходят в движения от двигателя внутреннего сгорания.
На велосипед двигатель установить нельзя.
1) Напишите миксин, который реализует двигатель только у наследников Car
2) Задайте свойство enginePower: int  с произвольным значением - мощность двигателя
3) Напишите функцию runEngine которая выводит строку "Двигатель работает. Максимальная скорость = мощности двигателя / вес автомобиля.
4) В Truck и SportCar в методе run выполните метод runEngine */

abstract class Car with Painter {
  late double weight;

  void run();
}

class Truck extends Car with Engine {
  Truck({required Colors color}) {
    setColor(color);
  }

  @override
  double get weight => 10;

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return "Грузовик ${colorName} цвета";
  }
}

class Sportcar extends Car with Engine {
  Sportcar({required Colors color}) {
    setColor(color);
  }
  @override
  double get weight => 2;

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return "Спорткар ${colorName} цвета";
  }
}

class Bike with Painter {
  Bike(Colors color) {
    setColor(color);
  }
}

enum Colors { red, greeen, blue }

mixin Painter {
  late String colorName;
  setColor(Colors color) {
    switch (color) {
      case Colors.red:
        colorName = 'красного';
        break;
      case Colors.greeen:
        colorName = 'зелёного';
        break;
      case Colors.blue:
        colorName = 'синего';
        break;
    }
  }
}

mixin Engine on Car {
  int enginePower = 600;
  runEngine() {
    print(
        'Двигатель работает. Максимальная скорость = ${enginePower / weight}');
  }
}

/* Task 3
Используя обобщения написать класс с методом, приводящим полученное значение в строку. */

class Generics<T> {
  Generics({required this.value});

  final T value;

  String convertToString() {
    return value.toString();
  }
}
