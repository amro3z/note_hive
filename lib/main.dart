import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_hive/cubits/addNoteCubit/cubit/add_cubit_cubit.dart';
import 'package:note_hive/cubits/observer/simple_observer.dart';
import 'package:note_hive/models/note_model.dart';
import 'package:note_hive/route.dart';

void main() async {
   Bloc.observer = SimpleObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_box');
  runApp(InitWidget(appRoute: AppRoute()));
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key, required this.appRoute});
  final AppRoute appRoute;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.generateRoute,
      ),
    );
  }
}
