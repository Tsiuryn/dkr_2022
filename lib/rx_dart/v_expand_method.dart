import 'package:rxdart/rxdart.dart';

///Если ваш исходный Stream испускает массивы объектов,
///а вы хотите обрабатывать каждый объект самостоятельно,
///вы можете использовать .expand
void main() {
  const fistList = <int>[1, 2, 2, 2, 3];
  const secondList = <int>[4, 5, 5, 5, 5, 6];
  const thirdList = <int>[7, 7, 7, 7, 5, 8, 9];

  final subject = PublishSubject<List<int>>();

  subject.expand((element) => element)
      .distinct()  //Метод distinct получает только если значение изменилось
      .listen(print);

  subject.add(fistList);
  subject.add(secondList);
  subject.add(thirdList);
}
