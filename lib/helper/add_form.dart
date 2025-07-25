import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_hive/base/custom_form_textfield.dart';
import 'package:note_hive/base/custom_bottom.dart';
import 'package:note_hive/base/list_of_color.dart';
import 'package:note_hive/cubits/addNoteCubit/cubit/add_cubit_cubit.dart';
import 'package:note_hive/models/note_model.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  String title = '';
  String description = '';
  int colorOfNote = Colors.yellow.value; // Default color
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
              title = value ?? '';
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
              description = value ?? '';
            },
          ),
          SizedBox(height: 20),
          ListOfColors(
            onColorSelected: (color) {
              setState(() {
                colorOfNote = color;
              });
            },
          ),

          SizedBox(height: 20),
          CustomBottom(
            title: "Save",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<AddNoteCubit>(context, listen: false).addNote(
                  NoteModel(
                    title: title,
                    description: description,
                    createdTime: DateTime.now(),
                    color: colorOfNote,
                  ),
                );
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


