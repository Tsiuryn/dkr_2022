# Какие способы есть внедрения зависимостей?

Внедрение зависимостей (DI, Dependency Injection) – это механизм передачи классу его зависимостей. Существует несколько конкретных видов или паттернов внедрения зависимостей: внедрение зависимости через конструктор (Constructor Injection), через метод (Method Injection) и через свойство (Property Injection).

Разные виды внедрения зависимостей предназначены для решения определенных задач:
- Через конструктор передаются обязательные зависимости класса, без которых работа класса невозможна. 
- Через метод передаются зависимости, которые нужны лишь одному методу, а не всем методам класса.
- Через свойства должны устанавливаться лишь необязательные зависимости (обычно, инфраструктурные), для которых существует значение по умолчанию.

**Передача зависимостей (DI) - это инструмент передачи классу его зависимости через конструктор, метод или свойство. Принцип инверсии зависимостей (DIP) - это принцип проектирования, который говорит, что классы должны зависеть от высокоуровневых абстракций.**



# Отличие между DependencyInjection и ServiceLocator?


## Что такое Dependency Inversion (буква D из аббревиатуры SOLID) ?
1. Модули верхних уровней не должны зависеть от модулей нижних уровней. Оба типа модулей должны зависеть от абстракций
1. Абстракции не должны зависеть от деталей. Детали должны зависеть от абстракций.

**Service Locator (SL)** — это паттерн, используемый для хранения, создания и глобального доступа к сервисам приложения/сущностям. 


**Dependency Injection (DI)** — это процесс предоставления компоненту внешней зависимости.

В настоящее время эти понятия немножко размыты на практике и для удобства существующие DI+SL реализации часто называют просто DI.


- [x] 2
- [x] 3
- [x] 4
- [x] 5

**DI означает:**
- cущности не знают о контейнере
- все зависимости предоставляются извне

```
abstract class Engine {}

class DefaultEngine implements Engine {}

class Car {
  final Engine engine;

  Car(this.engine);
}

void main() {
  final Car car = Car(DefaultEngine());
}
```

**SL означает:**
- cущность сама заботится о том, чтобы получить зависимость, однако получает уже готовую для работы зависимость

```
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

```


# Использованные статьи:

- [Отличие SL от DI](https://vk.com/@android_programers-v-chem-otlichiya-dependency-injection-di-ot-service-locator)
- [Отличие SL от DI_статья_2](https://habr.com/ru/post/465395/)
- [DI vs. DIP vs. IoC](http://sergeyteplyakov.blogspot.com/2014/11/di-vs-dip-vs-ioc.html#more)




