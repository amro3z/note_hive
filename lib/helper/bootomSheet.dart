import 'package:flutter/material.dart';
import 'package:note_hive/base/customTestField.dart';
import 'package:note_hive/base/customBottom.dart';

class BottomSheetWidget {
  Future showAddNoteBottomSheet(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min, // 👈 علشان يحتفظ بحجمه الطبيعي
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
        );
      },
    );
  }
}
