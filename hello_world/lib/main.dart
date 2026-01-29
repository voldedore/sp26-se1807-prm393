import 'dart:convert';
import 'dart:math';

import 'package:hello_world/animal.dart';
import 'package:hello_world/post.dart';
import 'package:hello_world/student.dart';
import 'package:http/http.dart' as http;
// Generic type
Stream<int> getNumbers() async* {
  yield Random().nextInt(100);
}
Stream<int> luckyNumbers() async* {
  while (true) {
    await Future.delayed(Duration(milliseconds: 500));
    var n = Random().nextInt(100);
    yield n;
    if (n == 79) {
      break;
    }
  }
}

Future<int> xoSo() async {
  return await Future.delayed(Duration(milliseconds: 500), () => getNumbers().first );
}
// Viet 1 doan code xo so
// Cu moi 1s/500ms se in ra man hinh 1 so random (dung Random().nextInt(100))
// Neu ket qua la 79 thi ngung lai va in dong chu "Xin chuc mung".


// BT2: Viet 1 doan code de tai ngau nhien 5 bai post, cho 2s giua moi lan tai.
// BT3: Viet 1 doan code de tai ngau nhien 5 Student (id, name, email, grade)
//      - API: https://jsonplaceholder.typicode.com/users/{id}
//      - cho 2 giay moi lan tai
//      - In ra man hinh Student (them 1 thuoc tinh la grade -> random 0-10)

Future<Post> fetchPost(int id) async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
  final response = await http.get(url);
  return Post.fromJson(jsonDecode(response.body));
}
void main() async {
  Post p = await fetchPost(7);
  p.displayInfo();
  // getNumbers().listen((value) => print(value));
  //
  // print('------------');
  //
  // while (true) {
  //   var val = await xoSo();
  //   print(val);
  //   if (val == 79){
  //     print("Xin chuc mung");
  //     break;
  //   }
  // }







  // print("Load user...");
  // var u = await fetchUser();
  // print("Finished! Username: $u");
  // //
  // final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/3");
  // final response = await http.get(url);
  // Post p = Post.fromJson(jsonDecode(response.body));
  // p.displayInfo();
  //
  // print("Bat dau");
  // Future(() => 1)
  // .then((val) => val + 1)
  // .then((v) => print(v));
  // print("Ket thuc");
  // Future(() => print("Future 2"));
  // print("Finish");

}

void describe({required String size, String color = "blue"}) {
  print("This item is $size and $color");
}

// Extension
// extension ParseNum on String {
//   int parseInt() {
//     return int.parse(this);
//   }
// }
Future<String> fetchUser() {
  return Future.delayed(Duration(milliseconds: 1000), () => 'Jon Snow');
}


