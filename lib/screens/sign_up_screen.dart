import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitor_app/screens/widgets/text_widget.dart';

import '../utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                text: 'Create your account',
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
                child: Column(children: []),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
