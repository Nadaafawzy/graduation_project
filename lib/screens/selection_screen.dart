import 'package:flutter/material.dart';
import 'package:graduation_project/screens/nurse/signup_nurse_screen.dart';
import '../widget/custom_button.dart';
import 'patient/login_screen.dart';

class SelectionScreen extends StatelessWidget {
  static const String routeName = '/selection';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 80,),
            Image.asset(
              'assets/onBoarding_photo-removebg-preview.png',
              fit: BoxFit.cover,
              height: 250,
            ),
      
            SizedBox(height: 40),
      
      
            Text(
              "Continue As",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
      
            SizedBox(height: 30),
      
            // Buttons
            CustomButton(text: "Nurse", onPressed: () {
              Navigator.pushNamed(context, SignupNurseScreen.routeName);
            }),
            SizedBox(height: 20),
            CustomButton(text: "Patient",
                onPressed: () {
                   Navigator.pushNamed(context, LoginScreen.routeName);
                }),
      
            Spacer(),
      
            // Bottom Rounded Container
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFF638ECB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
