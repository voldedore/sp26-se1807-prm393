import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/product.dart';
import 'package:state_management/provider/cart_notifier.dart';
import 'package:state_management/provider/user_provider.dart';

class HomeStless extends ConsumerWidget {
  const HomeStless({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Widget hiện tại cần 'watch' vào 'userProvider'
    final users = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              // Nav tới cart screen
              Navigator.pushNamed(context, "/cart");
            },
            icon: Badge(
              label: Text('${ref.watch(totalItemsProvider)}'),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(10, (index) {
          return Card(
            child: Column(
              children: [
                Text('Product ${index + 1}'),
                IconButton(
                  onPressed: () {
                    // Add to cart
                    // Goi hàm addItem của notifer
                    ref
                        .read(cartProvider.notifier)
                        .addItem(
                          Product(
                            id: index + 1,
                            name: 'Product ${index + 1}',
                            price: 50,
                          ),
                        );
                  },
                  icon: Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
