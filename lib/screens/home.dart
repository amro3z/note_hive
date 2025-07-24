import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_hive/cubits/loadCubit/load_cubit.dart';
import 'package:note_hive/helper/bottomSheet.dart';
import 'package:note_hive/helper/customAppBar.dart';
import 'package:note_hive/helper/noteItem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          BottomSheetWidget().showAddNoteBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: CustomAppBar(title: 'Notes', leadingIcon: Icons.search),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: BlocProvider(
            create: (context) => LoadCubit(),
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return NoteItem(
                  title: 'Flutter Tip $index',
                  subtitle: 'Amr Hamouda',
                  time: DateTime.now(),
                  icon: Icons.delete,
                  pagePath: '/editNote',
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
