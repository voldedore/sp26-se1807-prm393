import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/provider/user_provider.dart';

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
      appBar: AppBar(title: Text('Personal task')),
      body: Expanded(
        child: ListView(
          children: users.map((u) {
            return ListTile(
                title: Text(u.name),
                subtitle: Text(u.email),
                leading: Icon(Icons.person)
            );
          }).toList(),
        ),
      ),
    );
  }
}
