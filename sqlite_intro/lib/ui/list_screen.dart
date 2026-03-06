import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/ui/add_note_screen.dart';

import '../models/note.dart';
import '../providers/note_notifier.dart';
import 'edit_note_screen.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  @override
  Widget build(BuildContext context) {
    // Thay vì lấy data của provider (List<Note>) thì value hiện tại là AsyncValue<List<Note>>
    // cơ chế
    // 1) Loading -> Widget xoay xoay
    // 2) Error -> Text bao loi
    // 3) OK (data) -> ListView
    final notesAsyncValue = ref.watch(noteProvider);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Notes management")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(noteProvider.notifier).addNote('Note', 'Hello');
          // ref
          //     .read(noteProvider.notifier)
          //     .createNote(
          //       Note(title: 'Note Test', content: 'Content of the note'),
          //     );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: notesAsyncValue.when(
          // fn truyền vào nhận 1 param (tên biến là notes), kiểu là List<Note>
          data: (notes) => notes.isEmpty
              ? Text('There is no notes.')
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];

                    return ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // mainAxis = truc ngang, mainAxisSize = width
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditNoteScreen(),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(noteProvider.notifier)
                                  .deleteNote(note.id!);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          error: (err, stack) => Text('There is an error while loading notes.'),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

// Classwork
// 1) Điều chỉnh lại: Thêm giao diện (Form) hỗ trợ thêm mới 1 note Add new note
//   - Field: Title, Content. (nếu dùng controller thì nhớ dispose)
//   - Button: Để submit form. Submit sẽ save note vào DB và quay về màn hình List
//   - Form: Validate Title ít nhất 3 ký tự, content ít nhất 10 ký tự.
// 2) Điều chỉnh sự kiện press của nút Floating để route qua màn hình Add new note
// 3.1) Thêm Edit btn cho ListTile (cạnh Delete btn)
//   - Route user về màn hình Edit note (tao them
//   - Logic (validation, flow...) Tương tự màn hình Add note.
// 3.2) Tạo edit note screen có form giống với create, tự load data và fill sẵn
//   vào fields
//   - Get note by id (viết db helper và notifer)
//   - Edit note (viết db helper và notifer)
//
