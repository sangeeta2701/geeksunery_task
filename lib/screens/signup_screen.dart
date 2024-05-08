import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynery_assignment/screens/login_screen.dart';
import 'package:geeksynery_assignment/utils/colors.dart';
import 'package:geeksynery_assignment/utils/constants.dart';
import 'package:geeksynery_assignment/widgets/customButton.dart';
import 'package:geeksynery_assignment/widgets/sizedbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final List<String> professions = [
    "Developer",
    "Designer",
    "Teacher",
    "Doctor",
    "Writer",
    "Chef",
  ];
  String? selectedValue;

  void _registerUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', nameController.text);
    await prefs.setString('password', passwordController.text);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an Account",
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
                  height16,
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter email";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Enter Correct email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  height16,
                  TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(hintText: "Phone Number"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  height16,
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: wColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: gColor.withOpacity(0.4))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select Profession',
                          style: smallTextStyle,
                        ),
                        items: professions
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: tFTextStyle,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        iconStyleData: IconStyleData(
                            icon: Icon(
                          Icons.expand_more,
                          color: themeColor,
                          size: 20.sp,
                        )),
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: double.infinity,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  height40,
                  customThemeButton("Sign Up", () {
                    if (_formKey.currentState!.validate()) {
                      _registerUser(context);
                    }
                  })
                ],
              )),
        ),
      )),
    );
  }
}
