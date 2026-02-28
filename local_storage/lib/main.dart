import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/providers/shared_preference_provider.dart';
import 'package:local_storage/ui/list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Bảo đảm cho app Flutter được Binding
  WidgetsFlutterBinding.ensureInitialized();
  // Lấy instance của LocalStorage
  final sharedPreference = await SharedPreferences.getInstance();
  runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreference)
        ],
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
