import 'package:flutter/material.dart';
import 'package:graduation_project/screens/patient/home_screen.dart';
import 'package:graduation_project/screens/selection_screen.dart';
import 'package:graduation_project/screens/nurse/signup_nurse_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/patient/login_screen.dart';
import 'screens/patient/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        SelectionScreen.routeName: (context) => SelectionScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        SignupNurseScreen.routeName: (context) => SignupNurseScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}