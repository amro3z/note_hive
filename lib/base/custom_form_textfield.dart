import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  final Color? cursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final TextEditingController? controller;
  final int? maxLines;
  final AutovalidateMode autovalidateMode;
  final Function(String?) onSaved;
  final Function(String?)? onChange;
  const CustomFormTextField({
    super.key,
    required this.hintText,
    this.cursorColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.controller,
    this.disabledBorderColor,
    this.maxLines,
    required this.autovalidateMode,
    required this.onSaved,  this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      autovalidateMode: autovalidateMode,
      minLines: maxLines ?? 1,
      maxLines: null,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: TextStyle(
          color: Colors.white30,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
