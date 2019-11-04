// Imports

// Importing core libraries
import 'dart:io';

// Importing libraries from external packages
// import 'package:test/test.dart';

// Importing files
// import 'path/to/my_other_file.dart';

// Classes
class Spacecraft {
  String name;
  DateTime launchDate;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear => launchDate?.year; // read-only non-final property

  // Method.
  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

// Inheritance
class Orbiter extends Spacecraft {
  num altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

// Mixins
// https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins
class Piloted {
  final int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

// create mixed class - multiple inheritance
class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

// Interfaces
// Dart has no interface keyword. Instead, all classes implicitly define an interface. Therefore, you can implement any class
class MockSpaceship implements Spacecraft {
  @override
  DateTime launchDate;

  @override
  String name;

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int get launchYear => null;
}

// Abstract classes
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

// Getters and setters
class MyClass {
  int _aProperty = 0;
  List<int> _values = [];

  int get aProperty => _aProperty;

  set aProperty(int value) {
    if (value >= 0) {
      _aProperty = value;
    }
  }

  void addValue(int value) {
    _values.add(value);
  }

  // A computed property
  int get count {
    return _values.length;
  }
}

class InvalidPriceException implements Exception {}

class ShoppingCart {
  List<double> _prices = [];

  double get total => _prices.fold(0, (e, t) => e + t);

  set prices(List<double> value) {
    if (value.any((p) => p < 0)) {
      throw InvalidPriceException();
    }

    _prices = value;
  }
}

// Optional named parameters
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  MyDataObject copyWith({int newInt, String newString, double newDouble}) {
    return MyDataObject(
      anInt: newInt ?? this.anInt,
      aString: newString ?? this.aString,
      aDouble: newDouble ?? this.aDouble,
    );
  }
}

// Using this in a constructor
class MyColorOne {
  int red;
  int green;
  int blue;

  MyColorOne(this.red, this.green, this.blue);
}

class MyColorTwo {
  int red;
  int green;
  int blue;

  MyColorTwo({this.red = 0, this.green = 0, this.blue = 0});
}

class MyColorThree {
  int red;
  int green;
  int blue;

  MyColorThree([this.red = 0, this.green = 0, this.blue = 0]);
}

// app entry point
main() {
  // Hello World
  print("Hello, World!");

  // Variables
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  // Control flow statements
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (var object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  // Functions
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);

  flybyObjects.where((name) => name.contains('turn')).forEach(print);

  // Comments

  // This is a normal, one-line comment.

  /// This is a documentation comment, used to document libraries,
  /// classes, and their members. Tools like IDEs and dartdoc treat
  /// doc comments specially.

  /* Comments like these are also supported. */

  // Classes
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  // Async
  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  /*
  // The method above is equivalent to
  Future<void> printWithDelay(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }
  */

  print('before printWithDelay');
  printWithDelay('Hello, I am 1 sec delay');
  print('after printWithDelay');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (var object in objects) {
      try {
        var file = File('$object.txt');

        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }

        await file.create();
        await file.writeAsString('Start describing $object in this file.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  // Generators / Async generators
  // You can also use async*, which gives you a nice, readable way to build streams
  Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
    for (var object in objects) {
      await Future.delayed(oneSecond);
      yield '${craft.name} flies by $object';
    }
  }

  // Exceptions
  /*
  throw Exception('Something bad happened.');
  throw 'Waaaaaaah!';

  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }
  */

  /*
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }
  */

  /*
  try {
    breedMoreLlamas();
  } catch (e) {
    print('I was just trying to breed llamas!.');
    rethrow;
  }
  */

  Future<void> printDescriptions(List<String> objects) async {
    try {
      for (var object in objects) {
        var description = await File('$object.txt').readAsString();
        print(description);
      }
    } on IOException catch (e) {
      print('Could not describe object: $e');
    } finally {
      // Always clean up, even if an exception is thrown
      objects.clear();
    }
  }

  // Null-aware operators
  int a; // The initial value of any object is null.
  a ??= 3;
  print(a); // <-- Prints 3.
  a ??= 5;
  print(a); // <-- Still prints 3.

  print(1 ?? 3); // <-- Prints 1.
  print(null ?? 12); // <-- Prints 12.

  // Conditional property access
  // myObject?.someProperty // (myObject != null) ? myObject.someProperty : null
  // myObject?.someProperty?.someMethod()
  String upperCaseIt(String str) {
    return str?.toUpperCase();
  }

  // Collection literals
  final aListOfStrings = ['one', 'two', 'three'];
  final aSetOfStrings = {'one', 'two', 'three'};
  final aMapOfStringsToInts = {
    'one': 1,
    'two': 2,
    'three': 3,
  };

  final aListOfInts = <int>[];
  final aSetOfInts = <int>{};
  final aMapOfIntToDouble = <int, double>{};

  // final aListOfBaseType = <BaseType>[SubType(), SubType()];

  // Arrow syntax
  /*
  bool hasEmpty = aListOfStrings.any((s) {
    return s.isEmpty;
  });
  */
  bool hasEmpty = aListOfStrings.any((s) => s.isEmpty);

  // Cascades
  // myObject.someMethod() // myObject..someMethod()

  /*
  var button = querySelector('#confirm');
  button.text = 'Confirm';
  button.classes.add('important');
  button.onClick.listen((e) => window.alert('Confirmed!'));

  querySelector('#confirm')
    ..text = 'Confirm'
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'));
  */

  // Optional positional parameters
  int sumUpToFive(int a, [int b = 2, int c = 3, int d = 4, int e = 5]) {
    return a + b + c + d + e;
  }

  print(sumUpToFive(1)); // <-- prints 15

  // Optional named parameters
  void printName(String firstName, String lastName, {String suffix = ''}) {
    print('$firstName $lastName ${suffix}');
  }

  printName('Joe', 'Doe');
  printName('Poshmeister', 'Moneybuckets', suffix: 'IV');

  final myColorOne = MyColorOne(80, 80, 128);
  final myColorTwo = MyColorTwo(red: 80, green: 80, blue: 80);
  final myColorThree = MyColorThree(80, 80, 128);

  // Initializer lists
}
