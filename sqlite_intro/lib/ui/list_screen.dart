import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note.dart';
import '../providers/note_notifier.dart';

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
          ref
              .read(noteProvider.notifier)
              .createNote(
                Note(title: 'Note Test', content: 'Content of the note'),
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
                      trailing: IconButton(
                        onPressed: () {
                          ref.read(noteProvider.notifier).deleteNote(note.id!);
                        },
                        icon: Icon(Icons.delete),
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
