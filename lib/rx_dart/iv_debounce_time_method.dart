import 'package:rxdart/rxdart.dart';

///Это одна из маленьких жемчужин Rx!
///Представьте, что у вас есть поле поиска, которое осуществляет вызов API REST, если его текст изменен.
///Выполнение вызова API для каждого нажатия клавиши обходится дорого.
///Таким образом, вы хотели бы сделать вызов только если пользователь делает паузу на мгновение.
///Именно для этого используется функция debounce(),
///которая проглотит все входящие события, если за ними не последует пауза.
void main() async {
  var subject = PublishSubject<String>();

  subject.debounceTime(const Duration(milliseconds: 500)).listen(print);

  subject.add('A');
  subject.add('AB');

// Пока вывода нет

  await Future.delayed(const Duration(milliseconds: 550));

  subject.add("ABC");

  await Future.delayed(const Duration(milliseconds: 700));

// а сейчас мы получим наше последнее значение: 'ABC'
}
