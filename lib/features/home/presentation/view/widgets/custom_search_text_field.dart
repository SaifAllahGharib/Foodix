import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) onChange;

  const CustomSearchTextField({
    super.key,
    required this.onChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "search".tr(context),
        hintStyle: TextStyle(
          color: Colors.black45,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: Dimensions.height20(context)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20(context) * 2),
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20(context) * 2),
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
        ),
      ),
      onChanged: onChange,
    );
  }
}
