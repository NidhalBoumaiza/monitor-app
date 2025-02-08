import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitor_app/screens/widgets/my_customed_button.dart';
import 'package:monitor_app/screens/widgets/text_widget.dart';
import 'package:monitor_app/utils/colors.dart';

class SignUpScreen4 extends StatelessWidget {
  const SignUpScreen4({super.key});

  // Function to handle the "Finish" button
  Future<void> _onFinishPressed(BuildContext context) async {
    // Add logic for finishing the sign-up process
    // For example, save the child picture (if uploaded) and navigate to the home screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign up successful!')),
    );

    // Navigate to the home screen or login screen
    // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up - Step 4'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            TextWidget(
              text: "Upload Child Picture (Optional)",
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
            SizedBox(height: 20.h),
            IconButton(
              icon: Icon(Icons.camera_alt, size: 50.sp, color: AppColors.primaryColor),
              onPressed: () {
                // Add image picker logic here
              },
            ),
            SizedBox(height: 20.h),
            MyCustomButton(
              width: double.infinity,
              height: 45.h,
              function: () => _onFinishPressed(context), // Pass context to the function
              buttonColor: AppColors.primaryColor,
              text: "Finish",
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}