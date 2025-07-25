import 'package:flutter/material.dart';
import 'package:note_hive/base/CustomFormTextField.dart';
import 'package:note_hive/base/customBottom.dart';
import 'package:note_hive/constant.dart';
import 'package:note_hive/helper/customAppBar.dart';
import 'package:note_hive/models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? editTitle, editDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        leadingIcon: Icons.check,
        onLeadingPressed: () {
          submitTheChange(
            note: widget.note,
            editTitle: editTitle,
            editDescription: editDescription,
            context: context,
          );
         
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormTextField(
                  onChange: (value) {
                    editTitle = value;
                  },
                  hintText: widget.note.title,
                  cursorColor: Colors.blue,
                  enabledBorderColor: Colors.blue,
                  focusedBorderColor: Colors.green,
                  autovalidateMode: autovalidateMode,
                  onSaved: (value) {
                    editTitle = value ?? '';
                  },
                ),
                SizedBox(height: 20),
                CustomFormTextField(
                  onChange: (value) {
                    editDescription = value;
                  },
                  hintText: widget.note.description,
                  cursorColor: Colors.blue,
                  enabledBorderColor: Colors.blue,
                  focusedBorderColor: Colors.green,
                  maxLines: 5,
                  autovalidateMode: autovalidateMode,
                  onSaved: (value) {
                    editDescription = value ?? '';
                  },
                ),
                SizedBox(height: 20),
                CustomBottom(
                  title: "Save",
                  onPressed: () {
                    submitTheChange(
                      note: widget.note,
                      editTitle: editTitle,
                      editDescription: editDescription,
                      context: context,
                    );
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
