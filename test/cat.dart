import 'package:mockito/annotations.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat.mocks.dart';

// Real class
class Cat {
  String sound() => "Meow";
  bool eatFood(String food, {bool? hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

void main() {
  // Create mock object.
  var cat = MockCat();
}