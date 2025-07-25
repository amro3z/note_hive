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

String randomTextTest =
    'heat sent damage mostly brown relationship breathing acres promised sun course pick field of outline material twenty member got seems earn sister real shellsleave money account southern build sit ship have capital shelter he written blue movie weak alphabet declared snake trouble entirely directly beyond barn mightquickly box laid waste property ahead sun author frog brown writer only time cold quiet needle shown tool even ill stepped everyone exist rapidlyoffer shot along bigger neck block test community hide hurry suddenly cave park exercise adjective certainly cup task nearest plus branch just brush mainkeep explain degree pocket central listen organization eat symbol bean fell pitch harbor seven printed express black clay volume doubt compass brother swam select heat sent damage mostly brown relationship breathing acres promised sun course pick field of outline material twenty member got seems earn sister real shellsleave money account southern build sit ship have capital shelter he written blue movie weak alphabet declared snake trouble entirely directly beyond barn mightquickly box laid waste property ahead sun author frog brown writer only time cold quiet needle shown tool even ill stepped everyone exist rapidlyoffer shot along bigger neck block test community hide hurry suddenly cave park exercise adjective certainly cup task nearest plus branch just brush mainkeep explain degree pocket central listen organization eat symbol bean fell pitch harbor seven printed express black clay volume doubt compass brother swam select heat sent damage mostly brown relationship breathing acres promised sun course pick field of outline material twenty member got seems earn sister real shellsleave money account southern build sit ship have capital shelter he written blue movie weak alphabet declared snake trouble entirely directly beyond barn mightquickly box laid waste property ahead sun author frog brown writer only time cold quiet needle shown tool even ill stepped everyone exist rapidlyoffer shot along bigger neck block test community hide hurry suddenly cave park exercise adjective certainly cup task nearest plus branch just brush mainkeep explain degree pocket central listen organization eat symbol bean fell pitch harbor seven printed express black clay volume doubt compass brother swam select heat sent damage mostly brown relationship breathing acres promised sun course pick field of outline material twenty member got seems earn sister real shellsleave money account southern build sit ship have capital shelter he written blue movie weak alphabet declared snake trouble entirely directly beyond barn mightquickly box laid waste property ahead sun author frog brown writer only time cold quiet needle shown tool even ill stepped everyone exist rapidlyoffer shot along bigger neck block test community hide hurry suddenly cave park exercise adjective certainly cup task nearest plus branch just brush mainkeep explain degree pocket central listen organization eat symbol bean fell pitch harbor seven printed express black clay volume doubt compass brother swam select ff';
