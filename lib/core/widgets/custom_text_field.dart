import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final void Function(String val) onChanged;
  final TextEditingController controller;
  final void Function()? onPressedShowPassword;
  final bool isPassword;
  final bool? showPassword;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.controller,
    this.onPressedShowPassword,
    this.isPassword = false,
    this.showPassword = false,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      cursorColor: AppColors.primaryColor,
      onChanged: onChanged,
      obscureText: isPassword ? showPassword! : false,
      keyboardType: textInputType,
      obscuringCharacter: "•",
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressedShowPassword,
                icon: Icon(Icons.remove_red_eye_outlined),
              )
            : null,
        label: Text(
          hint,
          style: TextStyle(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.radius10(context),
          ),
          borderSide: BorderSide(
            color: AppColors.gray,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
