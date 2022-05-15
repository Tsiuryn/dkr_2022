import 'dart:async';

late StreamSubscription subscription;

void main() {
  int a = 0;
  final subject = StreamSubject();

  Stream.fromIterable([2,3,4,5,6]).asBroadcastStream().distinct();


  // final mll = Stream.periodic(const Duration(milliseconds: 2000),(i) => '$i');
  // mll.listen((event) {print(event);});


  subscription = subject.counterUpdates.listen((event) {
    a = event;
    print(a);
    if (a == 33) {
      subject.incrementCounter();
      subject.cancel();
      subscription.cancel();

    }
  });

  subject.incrementCounter();
}

class StreamSubject {
  int _counter = 0;
  final _streamController = StreamController<int>();
  bool _isStop = true;

  Stream<int> get counterUpdates => _streamController.stream;

  void incrementCounter() async {
    _isStop = !_isStop;
    for (var i = 0; i < 50; ++i) {
      if(_isStop) return;
      _counter++;
      _streamController.add(_counter);
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void cancel() {
    _streamController.close();
  }
}
