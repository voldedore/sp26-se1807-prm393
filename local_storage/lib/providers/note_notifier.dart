import 'dart:convert';
import 'package:local_storage/models/note.dart';
import 'package:local_storage/providers/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
  // Khóa lưu trữ các object 'note' của mình
  static const String _notesKey = "notes";

  @override
  List<Note> build() {
    _loadNotes();
    return [];
  }

  // List
  void _loadNotes() {
    // Gọi provider (NCC) liên quan đến Shared Preference
    final prefs = ref.read(sharedPreferencesProvider);
    // Connect vô LocalStorage để lấy String theo key phía trên
    final noteJson = prefs.getStringList(_notesKey) ?? [];
    state = noteJson.map((str) => Note.fromJson(json.decode(str))).toList();
  }

  // 1. Kết nối LS
  // 2.1. Mảng Note -> JSON -> String -> 2.2 save
  Future<void> _saveNote() async {
    final prefs = ref.read(sharedPreferencesProvider); // 1
    final noteJson = state // Lấy data từ state hiện tại
        .map((note) => json.encode(note.toJson()))
        .toList(); // 2.1
    await prefs.setStringList(_notesKey, noteJson); // 2
  }

  // CRUD
  Future<void> addNote(String title, String content) async {
    // Khởi tạo đối tượng mới
    final newNote = Note(
      id: DateTime.now().microsecondsSinceEpoch,
      title: title,
      content: content,
    );

    // Cập nhật lại state
    // (để notify những widget nào đang ngắm nhìn notifier này)
    state = [...state, newNote];
    // Save
    await _saveNote();
  }
}
