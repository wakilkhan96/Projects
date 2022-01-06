
class MyClass {
  T? myMethod<T>(T value) {
    print(value);
  }
}
// new MyClass().myMethod<List<String>>(['a', 'b', 'c']);
void main() {
  MyClass().myMethod<List<int>>([1, 2, 3]);
}