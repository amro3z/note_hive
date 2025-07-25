import 'package:flutter/material.dart';
import 'package:note_hive/models/note_model.dart';
import 'package:note_hive/screens/editNote.dart';
import 'package:note_hive/screens/home.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/editNote":
          final args = settings.arguments as NoteModel;
          return MaterialPageRoute(builder: (_) => EditNoteScreen(note: args));
        

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}