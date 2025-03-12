import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;

  CustomTextField({required this.hintText, this.maxLines = 1, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
          filled: true,
          fillColor: Colors.black45,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
          ),
        ),
      ),
    );
  }
}
