import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_hive/base/route.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes_box');
  runApp(InitWidget(appRoute: AppRoute()));
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key, required this.appRoute});
  final AppRoute appRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
