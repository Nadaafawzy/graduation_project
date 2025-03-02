import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_field.dart';

class SignupNurseScreen extends StatefulWidget {
  static const String routeName = '/signupnurse';

  @override
  _SignupNurseScreenState createState() => _SignupNurseScreenState();
}

class _SignupNurseScreenState extends State<SignupNurseScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedLocation;
  String? selectedExperience;
  String? selectedWorkTime;
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    child: InkWell(
                      child:
                          Icon(Icons.arrow_back, color: Colors.black, size: 28),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Login Form Container
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 7),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, size: 50, color: Colors.black),
                      ),
                      // Sign In Text
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF638ECB)),
                      ),
                      SizedBox(height: 5),
                      Text("Enter your Information",
                          style: TextStyle(color: Colors.grey)),

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
                      Row(
                        children: [
                          Text("Gender: "),
                          Radio(
                            value: "Male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          Text("Male"),
                          Radio(
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          Text("Female"),
                        ],
                      ),
                      SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Location *",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: ["Ghasham Rd", "Al Mohafaza", "Railway Services","College of Agriculture"]
                            .map((String location) {
                          return DropdownMenuItem(
                              value: location, child: Text(location));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;
                          });
                        },
                      ),

                     SizedBox(height: 15,),

// Experience Dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: "Experience",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items:
                            ["1 Year", "2 Years", "3+ Years","Other"].map((String exp) {
                          return DropdownMenuItem(value: exp, child: Text(exp));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedExperience = value;
                          });
                        },
                      ),

                      SizedBox(height: 15),

// Working time
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: "Working time *",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items:
                        ["from 12am to 8am", "from 8am to 4pm", "from 4pm to 12am","full time"].map((String worktime) {
                          return DropdownMenuItem(value: worktime, child: Text(worktime));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedWorkTime = value;
                          });
                        },
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                            text: "SIGN UP",
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   Navigator.pushNamed(context, LoginScreen.routeName);
                              // }
                            }),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account ?"),
                            TextButton(
                                onPressed: () {
                                  //Navigator.pushNamed(context, LoginScreen.routeName);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
