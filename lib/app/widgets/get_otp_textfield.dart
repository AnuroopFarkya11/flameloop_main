import 'package:flameloop/app/screens/auth_screens/getx_helper/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GetOtpTextField extends GetView<AuthController> {
  const GetOtpTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: TextFormField(
              controller: controller.firstNumber,
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
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: const OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: TextFormField(
              controller: controller.secondNumber,
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
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: const OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: TextFormField(
              controller: controller.thirdNumber,
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
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: const OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: TextFormField(
              controller: controller.fourthNumber,
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
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: const OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: TextFormField(
              controller: controller.fifthNumber,
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
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: const OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: TextFormField(
              controller: controller.sixthNumber,
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
              style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: const OutlineInputBorder(),
                hintText: "0",
                hintStyle: GoogleFonts.poppins(color: Colors.white38),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
