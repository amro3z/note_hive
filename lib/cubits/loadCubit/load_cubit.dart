import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_hive/models/note_model.dart';

part 'load_state.dart';

class LoadCubit extends Cubit<LoadState> {
  LoadCubit() : super(LoadInitial());
  fetchAllNotes() async {
    emit(LoadInProgress());
    try {
      await Future.delayed(Duration(seconds: 2));
      var noteBox = Hive.box<NoteModel>('notes_box');
    //because the note box returned the Notes as NoteModeL not a List to apply reversed on it
      emit(LoadSuccess(notes: noteBox.values.toList().reversed.toList()));
    } catch (e) {
      emit(LoadFailure(message: e.toString()));
    }
  }
}
