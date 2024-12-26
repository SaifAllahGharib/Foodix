import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final void Function(String val) onChanged;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLines: 1,
      cursorColor: AppColors.primaryColor,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? showPassword : false,
      obscuringCharacter: "•",
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  showPassword = !showPassword;
                  setState(() {});
                },
                icon: Icon(Icons.remove_red_eye_outlined),
              )
            : null,
        label: Text(
          widget.hint,
          style: TextStyle(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
