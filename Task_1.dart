import 'dart:collection';

main() {
//3 Создать строковую переменную с именем text  при помощи var, попытаться присвоить переменной a. Каков результат?
  var text = "Text";
  // Если переменная строгой типизации, то к ней нельзя присвоить переменную другого типа данных

//4 Создать переменную  с именем dyn при помощи dynamic, проинициализировать его целочисленным значением,
// далее попытаться присвоить переменной строковое значение переменной text. Каков результат? Почему?
  dynamic dyn = 12;
  dyn = text;
  // Значение присвоится, тк переменная dyn динамической типизации

//5 Создать переменную с именем fin  при помощи final и con при помощи const,
//попытаться изменить переменные, посмотреть результат. В чем отличия final от const?
  final fin = "Final";
  const con = "Contst";
  // fin = "final2";
  // con = "Const2";
  // Это неизменияемые переменные. Но const инициализировать надо сразу, а final во время выполнения

//6 Создать числовую переменную с именем a проверить является ли число четным.
  final int a = 27;
  a.isEven ? print("Yes") : print("No");

//7 Используете 32-битный символ Unicode u2665 выведите сообщение  в консоль: I ♥️ dart
  print('I \u2665 Dart');

//8

  // 8.1
  var list = [1, 2, 3, 4, 5, 6, 7, 8];
  // 8.2
  print(list.length);

  // 8.3
  list.sort((a, b) => b.compareTo(a));
  print('В обратном списке $list');

  // 8.4
  var newList = list.sublist(0, 3);
  print('Подсписок $newList');

  // 8.5
  for (int i = 0; i < list.length; i++) {
    list[i] == 5 ? print('Индекс 5 - $i') : null;
  }

  // 8.6
  list.removeWhere((item) => item > 4);
  print(list);

  // 8.7
  for (int i = 0; i < list.length; i++) {
    list[i] < 4 ? list[i] = list[i] * 10 : null;
  }
  print(list);

//9

  //9.1
  Map<String, dynamic> numberBook = {
    "Иван": 2264865,
    "Татьяна": 89523366684,
    "Олег": 84952256575,
  };
  //9.2
  print(numberBook);

  //9.3
  numberBook['Екатерина'] = 2359942;
  print(numberBook);

  //9.4
  var sortedMap = numberBook.entries.toList()
    ..sort((a, b) => b.key.compareTo(a.key));
  numberBook
    ..clear()
    ..addEntries(sortedMap);
  print(numberBook);

//10
  Set<String> mySet = {'Москва', 'Вашингтон', 'Париж'};
  mySet.add('Вашингтон');
  print(mySet.length);
  //  Выводит 3 элемента тк в Set каждый объект может встречаться только 1 раз

  String str =
      'She sells sea shells on the sea shore The shells that she sells are sea shells I am sure. So if she sells sea shells on the sea shore I am sure that the shells are sea shore shells';
  List<String> stringList = str.split('.');
  str = stringList[0] + stringList[1];
  stringList = str.toLowerCase().split(' ');
  Set<String> stringSet = {};
  stringList.forEach((element) {
    stringSet.add(element);
  });
  print(stringSet.length);
}

//1 Создать глобальную переменную типа int с именем a
int a = 23;

//2 Создать локальную переменную типа double с именем b
local() {
  double b;
}
