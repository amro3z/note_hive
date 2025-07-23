import 'package:flutter/material.dart';
import 'package:note_hive/base/CustomFormTextField.dart';
import 'package:note_hive/base/customBottom.dart';
import 'package:note_hive/helper/customAppBar.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String editTitle = '';
  String editDescription = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        leadingIcon: Icons.check,
        onLeadingPressed: () {
          Navigator.pop(context);
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
                  hintText: 'Title',
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
                  hintText: 'Description',
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
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
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
