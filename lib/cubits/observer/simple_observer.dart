import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleObserver implements BlocObserver {
  @override
  void onCreate(BlocBase bloc) {}

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('onChange: ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition: ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError: ${bloc.runtimeType}, $error');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('onEvent: ${bloc.runtimeType}, $event');
  }
}
