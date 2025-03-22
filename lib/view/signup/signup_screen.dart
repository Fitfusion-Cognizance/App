import 'package:fitnessapp/services/auth_service.dart';
import 'package:fitnessapp/utils/app_colors.dart';
import 'package:fitnessapp/view/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/round_gradient_button.dart';
import '../../common_widgets/round_textfield.dart';
import '../profile/complete_profile_screen.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "/SignupScreen";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isCheck = false;
  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      if (!isCheck) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please accept the Terms of Use")),
        );
        return;
      }

      String? result = await _authService.signUp(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
      );

      if (result != null && result.contains("successful")) {
        Navigator.pushNamed(context, CompleteProfileScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result ?? "Signup failed")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text("Hey there,", style: TextStyle(color: AppColors.blackColor, fontSize: 16)),
                  const SizedBox(height: 5),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  RoundTextField(
                    hintText: "First Name",
                    icon: "assets/icons/profile_icon.png",
                    textInputType: TextInputType.name,
                    textEditingController: _firstNameController,
                    validator: (value) => value!.isEmpty ? "Enter your first name" : null,
                  ),
                  const SizedBox(height: 15),
                  RoundTextField(
                    hintText: "Last Name",
                    icon: "assets/icons/profile_icon.png",
                    textInputType: TextInputType.name,
                    textEditingController: _lastNameController,
                    validator: (value) => value!.isEmpty ? "Enter your last name" : null,
                  ),
                  const SizedBox(height: 15),
                  RoundTextField(
                    hintText: "Email",
                    icon: "assets/icons/message_icon.png",
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                    validator: (value) =>
                    value!.isEmpty || !value.contains("@") ? "Enter a valid email" : null,
                  ),
                  const SizedBox(height: 15),
                  RoundTextField(
                    hintText: "Password",
                    icon: "assets/icons/lock_icon.png",
                    textInputType: TextInputType.text,
                    isObscureText: true,
                    textEditingController: _passwordController,
                    validator: (value) =>
                    value!.length < 6 ? "Password must be at least 6 characters" : null,
                    rightIcon: TextButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          "assets/icons/hide_pwd_icon.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: AppColors.grayColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        icon: Icon(
                          isCheck
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_outlined,
                          color: AppColors.grayColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "By continuing you accept our Privacy Policy and\nTerm of Use",
                          style: TextStyle(color: AppColors.grayColor, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  RoundGradientButton(
                    title: "Register",
                    onPressed: _signUp,
                  ),
                  const SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         width: double.maxFinite,
                  //         height: 1,
                  //         color: AppColors.grayColor.withOpacity(0.5),
                  //       ),
                  //     ),
                  //     Text("  Or  ", style: TextStyle(color: AppColors.grayColor, fontSize: 12)),
                  //     Expanded(
                  //       child: Container(
                  //         width: double.maxFinite,
                  //         height: 1,
                  //         color: AppColors.grayColor.withOpacity(0.5),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         width: 50,
                  //         height: 50,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(
                  //             color: AppColors.primaryColor1.withOpacity(0.5),
                  //             width: 1,
                  //           ),
                  //         ),
                  //         child: Image.asset("assets/icons/google_icon.png", width: 20, height: 20),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 30),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         width: 50,
                  //         height: 50,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(
                  //             color: AppColors.primaryColor1.withOpacity(0.5),
                  //             width: 1,
                  //           ),
                  //         ),
                  //         child: Image.asset("assets/icons/facebook_icon.png", width: 20, height: 20),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(color: AppColors.blackColor, fontSize: 14),
                        children: [
                          const TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: AppColors.secondaryColor1,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
