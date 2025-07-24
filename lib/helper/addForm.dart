import 'package:flutter/material.dart';
import 'package:note_hive/base/CustomFormTextField.dart';
import 'package:note_hive/base/customBottom.dart';

// ignore: must_be_immutable
class AddForm extends StatefulWidget {
   AddForm({super.key, required this.title, required this.description});
  String title;
  String description;

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 علشان يحتفظ بحجمه الطبيعي
        children: [
          CustomFormTextField(
            hintText: 'Title',
            cursorColor: Colors.blue,
            enabledBorderColor: Colors.blue,
            focusedBorderColor: Colors.green,
            autovalidateMode: autovalidateMode,
            onSaved: (value) {
              widget.title = value ?? '';
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
               widget.description = value ?? '';
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
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}