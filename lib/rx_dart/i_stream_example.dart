import 'dart:async';

late StreamSubscription subscription;

void main() {
  int eventValue = 0;
  final subject = StreamSubject();

  subscription = subject.counterUpdates.listen((event) {
    eventValue = event;
    print(eventValue);
    if (eventValue == 33) {
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
    if(_isStop) return;
    for (var i = 0; i < 50; ++i) {
      _counter++;
      _streamController.add(_counter);
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void cancel() {
    _streamController.close();
  }
}
