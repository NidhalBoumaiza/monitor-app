import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitor_app/screens/sign_up_screen_3.dart';
import 'package:monitor_app/screens/widgets/my_customed_button.dart';
import 'package:monitor_app/screens/widgets/reusable_text_field_widget.dart';
import 'package:monitor_app/screens/widgets/text_widget.dart';
import 'package:monitor_app/utils/colors.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final _motherNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool isLoading = false;

  // Function to handle the "Next" button
  Future<void> _onNextPressed() async {
    if (_motherNameController.text.isEmpty ||
        _fatherNameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields!")),
      );
      return Future.value(); // Explicitly return a Future
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignUpScreen3(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up - Step 2'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            ReusableTextFieldWidget(
              fillColor: const Color(0xfffafcfc),
              controller: _motherNameController,
              hintText: 'Mother Name',
              borderSide: const BorderSide(
                color: Color(0xfff3f6f9),
                width: 3,
                style: BorderStyle.solid,
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20.h),
            ReusableTextFieldWidget(
              fillColor: const Color(0xfffafcfc),
              controller: _fatherNameController,
              hintText: 'Father Name',
              borderSide: const BorderSide(
                color: Color(0xfff3f6f9),
                width: 3,
                style: BorderStyle.solid,
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20.h),
            ReusableTextFieldWidget(
              fillColor: const Color(0xfffafcfc),
              controller: _phoneNumberController,
              hintText: 'Phone Number',
              borderSide: const BorderSide(
                color: Color(0xfff3f6f9),
                width: 3,
                style: BorderStyle.solid,
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20.h),
            MyCustomButton(
              width: double.infinity,
              height: 45.h,
              function: isLoading ? null : _onNextPressed, // Pass the async function
              buttonColor: AppColors.primaryColor,
              text: isLoading ? "Loading..." : "Next", // Show loading text
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}