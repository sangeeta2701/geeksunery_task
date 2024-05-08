import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geeksynery_assignment/screens/home_screen.dart';

import 'package:geeksynery_assignment/utils/colors.dart';
import 'package:geeksynery_assignment/utils/constants.dart';
import 'package:geeksynery_assignment/widgets/customButton.dart';
import 'package:geeksynery_assignment/widgets/sizedbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _loginUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    if (nameController.text == savedUsername &&
        passwordController.text == savedPassword) {
      Fluttertoast.showToast(msg: "Login Successful!!");
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(username: nameController.text)));
    } else {
      Fluttertoast.showToast(msg: "Invalid username or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's Sign - In",
                      style: mainHeadingStyle,
                    ),
                    height28,
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: "Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    height16,
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    height40,
                    customThemeButton("Login", () {
                      if (_formKey.currentState!.validate()) {
                        _loginUser(context);
                      }
                    })
                  ],
                )),
          ),
        ),
      )),
    );
  }
}
