import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class Input_TextField extends StatelessWidget {
  String labelText = "";
  String? inputType = "text";

  Input_TextField({Key? key, required this.labelText, this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.poppins(color: Colors.white, letterSpacing: 1),
      cursorColor: Colors.white,
      keyboardType:
          (inputType == "text") ? TextInputType.text : TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white24,
        labelText: "$labelText",
        labelStyle: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w500, letterSpacing: 0),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
