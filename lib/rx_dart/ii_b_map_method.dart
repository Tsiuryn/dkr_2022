import 'dart:math';

import 'package:rxdart/rxdart.dart';

void main() {
  final subject = PublishSubject<int>(
      onCancel: () => print('on Cancel'),
      onListen: () => print('on Listen'),
  );

  subject.map((value) {
    final random = Random().nextInt(1000);
    return (value * random).toDouble();
  }).listen(print);

  subject.add(2);
  subject.add(3);
  subject.add(4);
  subject.add(5);
  subject.add(6);


  subject.close();
}
