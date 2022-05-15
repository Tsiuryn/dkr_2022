import 'package:rxdart/rxdart.dart';

void main() {
  final subject = PublishSubject<int>();

  // число нечетное
  subject.where((value) => value.isOdd).listen(print);

  subject.add(2);
  subject.add(4);
  subject.add(3);
  subject.add(8);
  subject.add(7);
  subject.add(6);
  subject.add(5);

}
