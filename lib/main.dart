import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/note_model.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/cubits/cubit/add_note_cubit.dart';
import 'package:flutter_application_1/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'Screens/NotesScreen.dart';
import 'cubits/cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: NotesScreen(),
      ),
    );
  }
}
