// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/EditColorListView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/Models/note_model.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/cubits/cubit/notes_cubit.dart';

import 'CustomAppBar.dart';
import 'CustomTextField.dart';
import 'colorItem.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  String? title, cotent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = cotent ?? widget.note.subTitle;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              cotent = value;
            },
            hint: widget.note.subTitle,
            maxlines: 5,
          ),
          EditColorListView(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
