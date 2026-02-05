// Notifier vs Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/model/product.dart';

/**************** MANUAL ************************/
// class CartNotifier extends Notifier<List<Product>> {
//   // init value -> fn build()
//   @override
//   List<Product> build() {
//     print('build() called');
//     return [
//       Product(id: 1, name: 'T-shirt', price: 80),
//       Product(id: 2, name: 'Hat', price: 30),
//       Product(id: 3, name: 'Jeans', price: 120),
//     ];
//   }
//   // Các p/thức khác để thao tác, quản lý, state
// }
//
// // tạo notifierProvider
// final cartNotifierProvider = NotifierProvider<CartNotifier, List<Product>>(() {
//   return CartNotifier();
// });

/********************** build_runner ***************/
part 'cart_notifier.g.dart';
@Riverpod(keepAlive: true)
class CartNotifier extends _$CartNotifier {
  // Init value
  @override
  List<Product> build() {
    print('build() called');
    return [
      Product(id: 1, name: 'T-shirt', price: 80),
      Product(id: 2, name: 'Hat', price: 30),
      Product(id: 3, name: 'Jeans', price: 120),
    ];
  }

  // Các p/thức thao tác, QL state
  void addItem(Product product) {
    print('Adding item with #${product.id}');
    print('Before: state has ${state.length} items');
    // state.add(product);
    // Trong Flutter, check state theo reference, obj state thêm element
    // thì state vẫn giữ ref
    state = [...state, product]; // Proper practice
    print('After: state has ${state.length} items');
  }
  void removeItem(Product product) {
    // state = ....
  }
  void clearCart() {
    state = [];
    // state.clear();
  }
}
// Một số lưu ý:
// 1. Annotation `@riverpod` tín hiệu cho generator hiểu là provider sẽ được gen
// 2. Naming convention (tên của provider được gen)
// Tên lớp            -> bỏ suffix Notifier -> thêm suffix Provider
// class CartNotifier ->        cart        ->         cartProvider
// 3. Lớp _$CartNotifier -> viết tắt của Notifier<>...
// 4. part ''; (báo cho biết file hiện tại còn 1 phần code trong file part)

// Dependent providers
// 2nd provider: specialCartProvider watch cartProvider
@riverpod
int totalItems(ref) { // totalItemsProvider
  return ref.watch(cartProvider).length;
}
