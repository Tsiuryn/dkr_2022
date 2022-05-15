abstract class Engine {}

class DefaultEngine implements Engine {}

class Car {
  final Engine engine;

  Car({required this.engine});
}

void main() {
  final Car car = Car(engine: DefaultEngine());
}
