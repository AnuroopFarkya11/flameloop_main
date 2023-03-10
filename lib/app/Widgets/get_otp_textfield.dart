import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Get_Otp_Textfield extends StatelessWidget {
  const Get_Otp_Textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(

              onChanged: (value){
                if(value.length==1)
                  {
                    FocusScope.of(context).nextFocus();
                  }
              },
              onSaved: (pin1){},
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(

              onChanged: (value){
                if(value.length==1)
                {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1){},

              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(

              onChanged: (value){
                if(value.length==1)
                {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1){},


              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(

              onChanged: (value){
                if(value.length==1)
                {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1){},

              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(

              onChanged: (value){
                if(value.length==1)
                {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1){},

              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
