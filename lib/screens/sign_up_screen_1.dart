import 'package:cloud_firestore/cloud_firestore.dart'; // Ensure this import is present
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitor_app/screens/sign_up_screen_2.dart';
import 'package:monitor_app/screens/widgets/my_customed_button.dart';
import 'package:monitor_app/screens/widgets/reusable_text_field_widget.dart';
import 'package:monitor_app/utils/colors.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final _childNameController = TextEditingController();
  final _childAgeController = TextEditingController();
  String? _selectedDisease;
  bool isLoading = false;

  final List<String> _diseaseOptions = [
    'Epilepsy',
    'Down Syndrome',
    'Severe Autism',
    'None',
  ];

  // Function to save user data to Firestore
  Future<void> _saveUserDataToFirestore(String userId, Map<String, dynamic> userData) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set(userData);
  }

  // Function to handle the "Next" button
  Future<void> _onNextPressed() async {
    if (_childNameController.text.isEmpty || _childAgeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields!")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Save data to Firestore
      final userData = {
        'childName': _childNameController.text.trim(),
        'childAge': _childAgeController.text.trim(),
        'diseaseType': _selectedDisease,
      };

      // Save data to Firestore
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _saveUserDataToFirestore(user.uid, userData);
      }

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignUpScreen2(),
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
        title: const Text('Sign Up - Step 1'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            ReusableTextFieldWidget(
              fillColor: const Color(0xfffafcfc),
              controller: _childNameController,
              hintText: 'Child Name',
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
              controller: _childAgeController,
              hintText: 'Child Age',
              borderSide: const BorderSide(
                color: Color(0xfff3f6f9),
                width: 3,
                style: BorderStyle.solid,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.h),
            DropdownButtonFormField<String>(
              value: _selectedDisease,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfffafcfc),
                hintText: 'Disease Type (Optional)',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xfff3f6f9),
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: _diseaseOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDisease = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            MyCustomButton(
              width: double.infinity,
              height: 45.h,
              function: isLoading ? null : _onNextPressed,
              buttonColor: AppColors.primaryColor,
              text: isLoading ? "Loading..." : "Next",
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}