// Shared Preference
// Provider
// Có nhiệm vụ thao tác vào Local Storage
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_provider.g.dart';

// Sau khi gen code cung cấp sharedPreferencesProvider
// Tạm thời throw lỗi, sẽ set value cho provider này sau.
// ref.watch(ten6Provider)
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}
