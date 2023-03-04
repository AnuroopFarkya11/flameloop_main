import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class input_phone_number extends StatelessWidget {
  const input_phone_number({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Indian FLag
          Image.asset(
            "assets/phonenumberscreen/flagindia.png",
            height: 30,
          ),

          const SizedBox(
            width: 10,
          ),
          // Indian code
          Text(
            '+91',
            style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),
          ),

          const SizedBox(
            width: 10,
          ),

          Expanded(
              child: TextField(
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white,letterSpacing: 2),
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                labelText: "Phone Number",
                labelStyle: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0),
                filled: true,
                fillColor: Colors.white24),
          ))
        ],
      ),
    );
  }
}
