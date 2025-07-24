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
      body: BlocProvider(
         create: (context) {
          final cubit = LoadCubit();
          cubit.fetchAllNotes(); // ✅ استدعاء تحميل البيانات
          return cubit;
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: BlocBuilder<LoadCubit, LoadState>(
              builder: (context, state) {
                if (state is LoadInProgress) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is LoadSuccess) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      final note = state.notes[index];
                      return NoteItem(
                        note: note,
                        pagePath: '/editNote',
                      );
                    },
                  );
                } else if (state is LoadFailure) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
