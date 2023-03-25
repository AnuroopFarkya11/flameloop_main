import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  final String inputType;
  final TextEditingController controller;

  const InputTextField({Key? key,required this.controller, this.labelText = "", this.inputType = "text"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(color: Colors.white, letterSpacing: 1),
      cursorColor: Colors.white,
      keyboardType:
          (inputType == "text") ? TextInputType.text : TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white24,
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w500, letterSpacing: 0),
        focusedBorder:
            OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}
