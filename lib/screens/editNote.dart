import 'package:flutter/material.dart';
import 'package:note_hive/base/customTestField.dart';
import 'package:note_hive/base/customBottom.dart';
import 'package:note_hive/helper/customAppBar.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notes', leadingIcon: Icons.check , 
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Title',
                cursorColor: Colors.blue,
                enabledBorderColor: Colors.blue,
                focusedBorderColor: Colors.green,
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: 'Description',
                cursorColor: Colors.blue,
                enabledBorderColor: Colors.blue,
                focusedBorderColor: Colors.green,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              CustomBottom(title: "Save"),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}