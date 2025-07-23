part of 'add_cubit_cubit.dart';

sealed class AddCubitState {}

final class AddCubitInitial extends AddCubitState {}
final class AddCubitLoading extends AddCubitState {}
final class AddCubitSuccess extends AddCubitState {
  final String title;
  final String description;
  final DateTime createdTime;
  final int color;

  AddCubitSuccess({required this.title, required this.description, required this.createdTime, required this.color});
}
final class AddCubitError extends AddCubitState {
  final String message;

  AddCubitError({required this.message});
}
