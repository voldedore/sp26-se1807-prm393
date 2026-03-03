import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/ui/list_screen.dart';

void main() async {
  // Bảo đảm cho app Flutter được Binding
  // Binding vẫn phải dảm bảo cho SQLite
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ProviderScope(
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListScreen(),
    );
  }
}
