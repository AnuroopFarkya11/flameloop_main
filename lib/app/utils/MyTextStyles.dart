import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTextStyle{
  late Color? textColor;
  late double? textSize ;


  MyTextStyle({required this.textColor,required this.textSize});


  getStyle()=>GoogleFonts.poppins(color: textColor,fontSize: textSize);



}