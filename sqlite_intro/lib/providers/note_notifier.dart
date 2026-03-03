import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_intro/db/database_helper.dart';

import '../models/note.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
  // Fn build() - Return type (kiểu dữ liệu trả về)
  // sẽ xác định data của provider này
  // data của provider = ref.watch(provider)
  @override
  Future<List<Note>> build() async {
    return DatabaseHelper.instance.getList();
    //                   ^
    //               Singleton
  }

  Future<void> deleteNote(int id) async {
    DatabaseHelper.instance.delete(id);
    ref.invalidateSelf(); // Báo cho build() cần chạy lại để cpaj nhật state
    await future;         // Chờ tất cả các async chay xong (new state được load xong)
  }

  Future<void> createNote(Note note) async {
    DatabaseHelper.instance.create(note);
    ref.invalidateSelf();
    await future;
  }


}
