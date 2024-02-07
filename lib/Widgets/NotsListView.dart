import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/note_model.dart';
import 'package:flutter_application_1/Widgets/NoteItem.dart';
import 'package:flutter_application_1/cubits/cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesLIstView extends StatelessWidget {
  const NotesLIstView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
