import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note.dart';
import '../providers/note_notifier.dart';

class EditNoteScreen extends ConsumerStatefulWidget {
  final Note note;
  const EditNoteScreen({super.key, required this.note});

  @override
  ConsumerState<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends ConsumerState<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

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
      appBar: AppBar(title: Text("Edit note")),
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
