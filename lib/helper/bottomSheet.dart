import 'package:flutter/material.dart';
import 'package:note_hive/base/CustomFormTextField.dart';
import 'package:note_hive/base/customBottom.dart';

class BottomSheetWidget {
  Future showAddNoteBottomSheet(BuildContext context) {
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String title = '';
    String description = '';
    return showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // 👈 ضروري علشان البوتوم شيت يبقى مرن مع الكيبورد
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(
              context,
            ).viewInsets.bottom, // 👈 علشان يتحرك مع الكيبورد
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Form(
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
            ),
          ),
        );
      },
    );
  }
}
