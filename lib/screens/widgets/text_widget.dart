import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  Color? color;
  double? letterSpacing;
  double? fontSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  // Constructor with fixed syntax and lowercase variable name
  TextWidget(
      {super.key,
      required this.text,
      this.color,
      this.letterSpacing,
      this.fontSize,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          letterSpacing: letterSpacing ?? 0.2,
          fontSize: fontSize ?? 13,
          fontWeight: fontWeight ?? FontWeight.w200,
        ),
      ),
    );
  }
}
