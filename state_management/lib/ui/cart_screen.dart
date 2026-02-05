import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/provider/cart_notifier.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Your cart'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Total items: 0'),
          ),
          ...items.map((item) { // Spread operator
            return ListTile(
              title: Text(item.name),
              subtitle: Text('\$${item.price}'),
            );
          }) // [ListTile(), ListTile()]
        ],
      ),
    );
  }
}
