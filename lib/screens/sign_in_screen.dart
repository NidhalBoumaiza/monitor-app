import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key}); // Constructor with key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Example usage of MyCustomButton
            MyCustomButton(
              width: double.infinity,
              height: 50.h,
              function: () async {
                // Add your sign-in logic here
                print('Sign In Button Pressed');
              },
              buttonColor: Colors.blue,
              text: 'Sign In',
              textButtonColor: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20.h), // Add some spacing
            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Future<void> Function()? function; // Accept async functions
  final Color buttonColor;
  final String text;
  final double? circularRadious;
  final Widget? widget;
  final Color? textButtonColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? icon;

  MyCustomButton({
    required this.width,
    required this.height,
    required this.function,
    required this.buttonColor,
    required this.text,
    this.circularRadious,
    this.widget,
    this.textButtonColor,
    this.fontSize,
    this.fontWeight,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AbsorbPointer(
        absorbing: function == null, // Disable button if function is null
        child: ElevatedButton(
          onPressed: function != null
              ? () async {
            await function!(); // Call the async function
          }
              : null, // Disable button if function is null
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: buttonColor,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circularRadious ?? 10),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox(),
                icon != null ? SizedBox(width: 10.w) : const SizedBox(),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: textButtonColor ?? Colors.white,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    fontSize: fontSize ?? 15,
                    letterSpacing: 0.1,
                  ),
                ),
                widget != null
                    ? Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: widget ?? const SizedBox(),
                )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}