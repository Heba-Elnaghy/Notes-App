import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/NoteBottomSheet.dart';
import 'package:flutter_application_1/Widgets/NotesScreenBody.dart';
import 'package:flutter_application_1/cubits/cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff176B87),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return NoteBottomSheet();
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: NotesBody(),
    );
  }
}
