void a() {
  print("Man ");
}

Future b() async {
  print("is");
  String data = "";
  Duration timeDuration = const Duration(seconds: 3);
  await Future.delayed(timeDuration, () {
    data = "mortal.";
  });
  return data;
}

void c(String data) {
  print('$data');
}
void task() async {
  a();
  String data = await b();
  c(data);
}
void main() {
  task();
}
