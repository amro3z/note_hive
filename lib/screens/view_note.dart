import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_hive/cubits/loadCubit/load_cubit.dart';
import 'package:note_hive/helper/customAppBar.dart';
import 'package:note_hive/models/note_model.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({super.key, required this.note});
  final NoteModel note;
  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Note',
        leadingIcon: Icons.edit,
      onLeadingPressed: () async {
          //  Navigate to EditNote screen and wait for it to complete
          // This ensures we pause execution here until user finishes editing
          await Navigator.pushNamed(
            context,
            '/editNote',
            arguments: widget.note,
          );

          //  After returning from EditNote screen, rebuild the UI to reflect changes
          // Without this, the updated note data won't appear until a full refresh
          setState(() {});

          // Optionally reload the full notes list if needed elsewhere in the app
          BlocProvider.of<LoadCubit>(context).fetchAllNotes();
        },


      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.note.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 32.0,
                top: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.note.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
