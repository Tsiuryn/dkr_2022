import 'package:rxdart/rxdart.dart';

void main() {
  final subject = PublishSubject<int>();

  subject.bufferCount(5).listen(print);

  for (var i = 0; i < 30; ++i) {
    subject.add(i);
  }

  subject.close();
}
