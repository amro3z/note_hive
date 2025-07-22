import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String title;
  const CustomBottom({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: () {
        Navigator.pop(context); 
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
