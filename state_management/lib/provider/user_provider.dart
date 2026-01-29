import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/model/user.dart';

// File hiện tại (user_provider.dart) có 1 phần code nữa
// nằm trong file 'user_provider.g.dart'
// Để có được file này, chạy lệnh dart run build_runner build
// Naming convention tên file '.g.dart'
part 'user_provider.g.dart';
List<User> users = [
  User(id: 1, name: 'John', email: 'john@mail'),
  User(id: 2, name: 'NVA', email: 'john@mail'),
  User(id: 3, name: 'NBV', email: 'john@mail'),
  User(id: 4, name: 'TBC', email: 'john@mail'),
  User(id: 5, name: 'Mark', email: 'john@mail'),
];
// Manual
// final userProvider = Provider((ref) {
//   return users;
// });
// Generator: Naming convention tên fn + suffix Provider
//                            -> userProvider
// Annotation @riverpod
@riverpod
List<User> user(ref) {
  return users;
}
