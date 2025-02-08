import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitor_app/screens/sign_up_screen_4.dart';
import 'package:monitor_app/screens/widgets/my_customed_button.dart';
import 'package:monitor_app/screens/widgets/reusable_text_field_widget.dart';
import 'package:monitor_app/screens/widgets/text_widget.dart';
import 'package:monitor_app/utils/colors.dart';

class SignUpScreen3 extends StatefulWidget {
  const SignUpScreen3({super.key});

  @override
  State<SignUpScreen3> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool obsecureText = true;
  bool isLoading = false;

  // Function to handle Firebase Auth registration
  Future<void> _signUpWithEmailAndPassword() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!")),
      );
      return Future.value(); // Explicitly return a Future
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Create user with Firebase Auth
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignUpScreen4(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "An error occurred")),
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
        title: const Text('Sign Up - Step 3'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            ReusableTextFieldWidget(
              fillColor: const Color(0xfffafcfc),
              controller: _emailController,
              hintText: 'Email',
              borderSide: const BorderSide(
                color: Color(0xfff3f6f9),
                width: 3,
                style: BorderStyle.solid,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.h),
            ReusableTextFieldWidget(
              fillColor: const Color(0xfffafcfc),
              controller: _passwordController,
              hintText: 'Password',
              obsecureText: obsecureText,
              suffixIcon: IconButton(
                icon: Icon(
                  obsecureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
              ),
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
              controller: _confirmPasswordController,
              hintText: 'Confirm Password',
              obsecureText: obsecureText,
              borderSide: const BorderSide(
                color: Color(0xfff3f6f9),
                width: 3,
                style: BorderStyle.solid,
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20.h),
            MyCustomButton(
              width: double.infinity,
              height: 45.h,
              function: isLoading ? null : _signUpWithEmailAndPassword, // Pass the async function
              buttonColor: AppColors.primaryColor,
              text: isLoading ? "Signing Up..." : "Next", // Show loading text
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}