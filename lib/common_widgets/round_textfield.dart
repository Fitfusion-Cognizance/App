import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  final String icon;
  final TextInputType textInputType;
  final bool isObscureText;
  final Widget? rightIcon;
  final String? Function(String?)? validator; // Validator function

  const RoundTextField({
    Key? key,
    this.textEditingController,
    required this.hintText,
    required this.icon,
    required this.textInputType,
    this.isObscureText = false,
    this.rightIcon,
    this.validator, // Accepts validator function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrayColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: isObscureText,
        validator: validator, // Assign validator here
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            child: Image.asset(
              icon,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: AppColors.grayColor,
            ),
          ),
          suffixIcon: rightIcon,
          hintStyle: TextStyle(fontSize: 12, color: AppColors.grayColor),
        ),
      ),
    );
  }
}
