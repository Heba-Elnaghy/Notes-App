// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccees extends NotesState {}
