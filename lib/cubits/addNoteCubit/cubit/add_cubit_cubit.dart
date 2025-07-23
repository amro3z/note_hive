import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_cubit_state.dart';

class AddCubitCubit extends Cubit<AddCubitState> {
  AddCubitCubit() : super(AddCubitInitial());
}
