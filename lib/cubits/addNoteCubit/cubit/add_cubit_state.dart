part of 'add_cubit_cubit.dart';

@immutable
sealed class AddCubitState {}

final class AddCubitInitial extends AddCubitState {}
final class AddCubitLoading extends AddCubitState {}
final class AddCubitSuccess extends AddCubitState {
  final String title;
  final String description;

  AddCubitSuccess({required this.title, required this.description});
}
final class AddCubitError extends AddCubitState {
  final String message;

  AddCubitError({required this.message});
}
