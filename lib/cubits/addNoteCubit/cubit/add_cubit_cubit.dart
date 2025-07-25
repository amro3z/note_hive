import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_hive/models/note_model.dart';

part 'add_cubit_state.dart';

class AddNoteCubit extends Cubit<AddCubitState> {
  AddNoteCubit() : super(AddCubitInitial());

  addNote(NoteModel note) async {
    log("📝 Trying to add note...");
    var noteBox = Hive.box<NoteModel>('notes_box');
    emit(AddCubitLoading());
    await Future.delayed(Duration(seconds: 1));
    try {
      await noteBox.add(note);
      log("✅ Note added successfully to Hive");
      emit(
        AddCubitSuccess(
          title: note.title,
          description: note.description,
          createdTime: note.createdTime,
          color: 123,
        ),
      );
    } catch (e) {
      log("❌ Error in addNote: $e");
      emit(AddCubitError(message: e.toString()));
    }
  }

}
