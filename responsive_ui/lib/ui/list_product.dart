import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/side_menu.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.col});

  final int col;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      drawer: SideMenu(),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // Classwork
        // Thử điều chỉnh spacing theo kích thước màn hình
        crossAxisCount: col,
        children: List.generate(12, (i) {
          return Card(child: Text('Product ${i + 1}'));
        }),
      ),
    );
  }
}

// Tách code cho dễ hình dung, lưu ý, đang bị duplicate code
class ListProductHorizontal extends StatelessWidget {
  const ListProductHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 180, child: SideMenu()),
          VerticalDivider(),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 4,
              children: List.generate(12, (i) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    print('Card ${i}: width=${constraints.maxWidth}');
                    return Card(child: Text('Product ${i + 1}'));
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
