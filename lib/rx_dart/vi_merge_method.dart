import 'package:rxdart/rxdart.dart';

void main() {
  final textStream = PublishSubject<String>();
  final intStream = PublishSubject<int>();
  
  Rx.merge([textStream, intStream]).listen(print);

  // Rx.concat([textStream, intStream]).listen((event) {
  //   print(event);
  // });

  textStream.add('hello');
  intStream.add(4);
  textStream.add('add');
  intStream.add(33);
  textStream.add('go');
  intStream.add(55);
}