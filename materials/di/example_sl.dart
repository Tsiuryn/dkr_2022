void main() {
  final _locator = Locator();
  _locator.bind<Engine>(DefaultEngine());

  final car = Car(
    engine: _locator.resolve<Engine>(),
  );
  car.powerEngine();
}

class Locator {
  final Set _dependencies = {};

  void bind<T>(T value) {
    _dependencies.add(value);
  }

  T resolve<T>() {
    return _dependencies.firstWhere((element) => element is T, orElse: () {
      return throw ('Dependency didn\'t register');
    });
  }
}

abstract class Engine {
  void power();
}

class DefaultEngine implements Engine {
  @override
  void power() {
    print('35 kW');
  }
}

class Car {
  final Engine engine;

  Car({required this.engine});

  void powerEngine() {
    engine.power();
  }
}
