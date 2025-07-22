import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color? cursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final TextEditingController? controller;
  final int? maxLines;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.cursorColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.controller,
    this.disabledBorderColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: maxLines ?? 1,
      maxLines: null,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: TextStyle(
          color: Colors.grey,
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
