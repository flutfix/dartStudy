import 'dart:convert';
import 'dart:io';

void main() {
  //1 Используя switch, напишите программу в методе main(), которая выводит название месяца по номеру от 1 до 12.
  int monthNum = 6;
  switch (monthNum) {
    case 1:
      print('Январь');
      break;
    case 2:
      print('Февраль');
      break;
    case 3:
      print('Март');
      break;
    case 4:
      print('Апрель');
      break;
    case 5:
      print('Май');
      break;
    case 6:
      print('Июнь');
      break;
    case 7:
      print('Июль');
      break;
    case 8:
      print('Август');
      break;
    case 9:
      print('Сентябрь');
      break;
    case 10:
      print('Октябрь');
      break;
    case 11:
      print('Ноябрь');
      break;
    case 12:
      print('Декабрь');
      break;
    default:
      print('Месяц не найден');
  }

  // 2 Используя циклы, напишите программу, которая выводит на консоль все четные числа от 0 до 100.
  for (int i = 0; i <= 100; i++) {
    i.isEven ? print(i) : null;
  }

  //3 Написать программу, которая слушает ввод в консоли, складывает вводимые пользователем числа.
  //Если пользователь ввел stop, завершить приложение. Если пользователь вводит некорректные данные - прервать текущую итерацию, начать заново.
  print(
      'Введите число и нажмите Enter, все введенные числа будут суммироваться, чтобы завершить процесс напишите "stop"');
  var input;
  int sum = 0;
  while (input != 'stop') {
    stdout.write('Введите число:');
    input = stdin.readLineSync();
    try {
      sum += int.parse(input);
    } catch (e) {
      input == 'stop' ? print('Конец цикла') : print('Вы ввели не число');
      sum = 0;
      continue;
    }
    print('sum = $sum');
  }
}
