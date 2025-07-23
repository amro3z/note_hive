import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_hive/models/note_model.dart';

part 'add_cubit_state.dart';

class AddCubitCubit extends Cubit<AddCubitState> {
  AddCubitCubit() : super(AddCubitInitial());

  addNote(NoteModel note) async {
    var noteBox = Hive.box<NoteModel>('notes_box');
    emit(AddCubitLoading());
    try {
      await noteBox.add(note);
      emit(AddCubitSuccess(title: note.title, description: note.description, createdTime: note.createdTime, color: note.color));
    } catch (e) {
      emit(AddCubitError(message: e.toString()));
    }
  }
}
