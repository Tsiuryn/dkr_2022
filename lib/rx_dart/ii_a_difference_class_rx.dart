import 'package:rxdart/rxdart.dart';



void main() {
    //кеширует последний элемент stream
  final sub = BehaviorSubject<int>();

    //обычный broadcast stream
  // final sub = PublishSubject<int>();

    //кеширует все элементы stream или заданное количество последних элементов
  // final sub = ReplaySubject<int>(maxSize: 2);

  sub.add(1);
  sub.add(2);
  sub.add(3);
  sub.listen((value) {
    print('The first listener: $value');
  });
  sub.add(4);
  sub.add(5);
  sub.add(6);
  sub.add(7);

  sub.listen((value) {
    print('The second listener: $value');
  });
}