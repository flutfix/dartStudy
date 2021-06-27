import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() async {
  // TASK 1
  /*Напишите код, который дожидается выполнения функции и распечатывает на консоль "Введена строка stroke_name".*/
  final task1 = Task1();
  print('Ожидание ввода 1');
  var strokeName = await task1.inputKeyboard();
  print('Введена строка $strokeName');

  /*Поэкспериментируйте с async/await и then*/
  print('Ожидание ввода 2');
  await task1
      .inputKeyboard()
      .then((strokeName) => print('Введена строка $strokeName'));

  // TASK 2
  final task2 = Task2();
  print('Программа работает, чтобы остановить введите "exit"');
  task2.inputKeyboard().listen((strokeName) {
    strokeName != 'exit'
        ? print('Введена строка $strokeName')
        : print('Программа завершена');
  });
}

/* TASK 1
Используя Future в
  1. Напишите функцию, которая считывает данные с клавиатуры. Функция должна возвращать Future.
  2. Напишите код, который дожидается выполнения функции и распечатывает на консоль "Введена строка stroke_name".
  3. Поэкспериментируйте с async/await и then
*/
class Task1 {
  late final Encoding _encoding;

  Task1() {
    _encoding = Encoding.getByName('utf-8') ?? SystemEncoding();
  }

  Future<String> inputKeyboard() async {
    return stdin.readLineSync(encoding: _encoding) ?? '';
  }
}

/* TASK 2
Используя Stream
   1. Напишите функцию, которая считывает данные с клавиатуры до тех пор, пока не будет введен строка "exit". Функция должна возвращать Stream.
   2. Напишите код, который прослушивает поток и распечатывает на консоль "Введена строка stroke_name" каждый раз, когда в потоке появляется новое событие.
*/
class Task2 {
  late final Encoding _encoding;

  Task2() {
    _encoding = Encoding.getByName('utf-8') ?? SystemEncoding();
  }

  Stream<String> inputKeyboard() async* {
    late String s;
    do {
      s = stdin.readLineSync(encoding: _encoding) ?? '';
      yield s;
    } while (s != 'exit');
  }
}
