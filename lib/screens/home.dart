import 'package:flutter/material.dart';
import 'package:note_hive/helper/bootomSheet.dart';
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
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {
              // Action for adding a new note
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return NoteItem(
                title: 'Flutter Tip $index',
                subtitle: 'Amr Hamouda',
                time: DateTime.now(),
                icon: Icons.delete,
              );
            },
          ),
        ),
      ),
    );
  }
}
