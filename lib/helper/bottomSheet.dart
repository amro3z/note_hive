import 'package:flutter/material.dart';
import 'package:note_hive/helper/addForm.dart';

class BottomSheetWidget {
  String title = '';
  String description = '';
  Future showAddNoteBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // 👈 ضروري علشان البوتوم شيت يبقى مرن مع الكيبورد
      builder: (context) {
        return AddForm (
          title: title,
          description: description,
        );
      },
    );
  }
}
