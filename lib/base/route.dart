import 'package:flutter/material.dart';
import 'package:note_hive/screens/editNote.dart';
import 'package:note_hive/screens/home.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/editNote":
        return MaterialPageRoute(builder: (_) => const EditNoteScreen());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}