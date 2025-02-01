import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_app/screens/sign_up_screen.dart';
import 'package:monitor_app/screens/widgets/my_customed_button.dart';
import 'package:monitor_app/screens/widgets/reusable_text_field_widget.dart';
import 'package:monitor_app/screens/widgets/text_widget.dart';
import 'package:monitor_app/utils/colors.dart';

import '../utils/navigation_with_transition.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: TextWidget(
                text: 'Sign In',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              )),
          body: Container(
            width: 1.sw,
            height: 1.sh, // Use 1.sh instead of 2.sh to avoid overflow
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Container(
                      height: 220.h,
                      width: 230.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Doctor-rafiki.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ReusableTextFieldWidget(
                      fillColor: Color(0xfffafcfc),
                      controller: _emailController,
                      hintText: 'Email',
                      borderSide: const BorderSide(
                        color: Color(0xfff3f6f9),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ReusableTextFieldWidget(
                      fillColor: Color(0xfffafcfc),
                      onPressedSuffixIcon: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                      controller: _passwordController,
                      obsecureText: obsecureText,
                      hintText: 'Password',
                      suffixIcon: Icon(
                        obsecureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 5.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextWidget(
                        text: "Did You forget your password?",
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyCustomButton(
                      width: double.infinity,
                      height: 45.h,
                      function: () {},
                      buttonColor: AppColors.primaryColor,
                      text: "Sign In",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
                          context,
                          const SignUpScreen(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Don't have an account? ",
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          TextWidget(
                            text: "Sign Up",
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                          TextWidget(
                            text: " Or ",
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyCustomButton(
                      width: double.infinity,
                      height: 45.h,
                      function: () {},
                      buttonColor: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      text: "Continue with Google",
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
