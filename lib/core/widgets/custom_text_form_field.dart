import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final void Function(String val)? onChanged;
  final void Function()? onPressedShowPassword;
  final bool isPassword;
  final bool? showPassword;
  final TextInputType textInputType;
  final bool enabled;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.onPressedShowPassword,
    this.isPassword = false,
    this.showPassword,
    this.textInputType = TextInputType.text,
    this.enabled = true,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.textStyle15(
            context,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: Dimensions.height10),
        SizedBox(
          height: Dimensions.height45 * 1.05,
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            onChanged: onChanged,
            obscureText: isPassword && !(showPassword ?? false),
            keyboardType: textInputType,
            style: Styles.textStyle15(
              context,
            ).copyWith(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: hintStyle ?? Styles.textStyle12(context),
              filled: true,
              fillColor: AppColors.gray.withOpacity(0.2),
              contentPadding: EdgeInsets.symmetric(
                vertical: Dimensions.height12,
                horizontal: Dimensions.height15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                borderSide: BorderSide.none,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        (showPassword ?? false)
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: onPressedShowPassword,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
