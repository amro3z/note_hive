part of 'load_cubit.dart';

@immutable
sealed class LoadState {}

final class LoadInitial extends LoadState {}

final class LoadInProgress extends LoadState {}

final class LoadSuccess extends LoadState {
  final List<NoteModel> notes;

  LoadSuccess({required this.notes});
}
final class LoadFailure extends LoadState {
  final String message;

  LoadFailure({required this.message});
}