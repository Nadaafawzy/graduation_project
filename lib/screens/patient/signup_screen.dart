import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_field.dart';
import 'login_screen.dart';


enum Gender{male , female}

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image Section
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/welcom_photo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Login Form Container
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sign In Text
                      Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                            color: Color(0xFF638ECB)),
                      ),
                      SizedBox(height: 5),
                      Text("Enter your Information", style: TextStyle(color: Colors.grey)),

                      SizedBox(height: 20),

                      CustomTextField(
                        label: "Full Name",
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Email Field
                      CustomTextField(
                        label: "Email",
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Password Field
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Password Field
                      CustomTextField(
                        label: "Phone Number",
                        controller: phoneController,
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your phone";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),
                      // Gender Selection
                      //Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<Gender>(
                              title: Text("Male"),
                              value: Gender.male,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<Gender>(
                              title: Text("Female"),
                              value: Gender.female,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),



                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(text: "SIGN UP",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, LoginScreen.routeName);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            // OR Text
            Text("or", style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold, color: Color(0xFF638ECB))),

            SizedBox(height: 10),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.red, size: 30),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 30),
                ),
              ],
            ),

            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text("SIGN IN",
                        style: TextStyle(color: Colors.red,
                            fontWeight: FontWeight.bold),)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
