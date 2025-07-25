import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_hive/cubits/loadCubit/load_cubit.dart';
import 'package:note_hive/models/note_model.dart';

void submitTheChange({
  required NoteModel note,
  String? editTitle,
  String? editDescription,
  required BuildContext context,
}) {
  note.title = editTitle ?? note.title;
  note.description = editDescription ?? note.description;
  note.save();
  BlocProvider.of<LoadCubit>(context).fetchAllNotes();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      animation: const AlwaysStoppedAnimation(1.0),
      content: Text(
        'Note updated successfully',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
  Navigator.pop(context);
}
