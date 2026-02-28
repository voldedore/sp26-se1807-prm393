import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/providers/note_notifier.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  @override
  Widget build(BuildContext context) {
    // Ngắm nhìn Notifier
    final notes = ref.watch(noteProvider);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Notes management")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(noteProvider.notifier).addNote('Note', 'Hello');
          },
          child: Icon(Icons.add),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: notes.map((note) {
            return Card(
              elevation: 4,
              child: Center(
                child: Column(children: [Text(note.title), Text(note.content)]),
              ),
            );
          }).toList(),
        )
    );
  }
}
