import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/note_model.dart';
import 'package:flutter_application_1/Widgets/CustomAppBar.dart';
import 'package:flutter_application_1/Widgets/NotsListView.dart';
import 'package:flutter_application_1/cubits/cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: "Note",
            icon: Icons.search,
          ),
          Expanded(child: NotesLIstView()),
        ],
      ),
    );
  }
}
