// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Models/note_model.dart';
import '../Widgets/EditNotesBody.dart';

class EditNOteScreen extends StatelessWidget {
  const EditNOteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesBody(
        note: note,
      ),
    );
  }
}
