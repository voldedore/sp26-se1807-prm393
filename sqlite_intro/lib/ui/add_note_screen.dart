import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/models/note.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';

class AddNoteScreen extends ConsumerStatefulWidget {
  const AddNoteScreen({super.key});

  @override
  ConsumerState<AddNoteScreen> createState() => _AddNState();
}

class _AddNState extends ConsumerState<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Note newNote = Note(
        title: _titleController.text,
        content: _contentController.text,
      );
      ref.read(noteProvider.notifier).createNote(newNote);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add note")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Title"),
              validator:
                  (v) => // fat arrow
                      v == null || v.isEmpty ? "Enter title" : null,
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: "Content"),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Enter content";
                }
                if (v.length < 5) {
                  return "Enter content more than 5 characters.";
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: _submitForm, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
