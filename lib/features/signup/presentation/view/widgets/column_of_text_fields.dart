import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';

class ColumnOfTextFields extends StatefulWidget {
  final BuildContext context;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final void Function(String? val) validator;

  const ColumnOfTextFields({
    super.key,
    required this.context,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.validator,
  });

  @override
  State<ColumnOfTextFields> createState() => _ColumnOfTextFieldsState();
}

class _ColumnOfTextFieldsState extends State<ColumnOfTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget.name,
          hint: "hint_name".tr(widget.context),
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15(widget.context)),
        CustomTextField(
          controller: widget.email,
          hint: "hint_email".tr(widget.context),
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15(widget.context)),
        CustomTextField(
          controller: widget.phone,
          hint: "hint_phone".tr(widget.context),
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15(widget.context)),
        CustomTextField(
          controller: widget.password,
          isPassword: true,
          hint: "hint_pass".tr(widget.context),
          onPressedShowPassword:
              widget.context.read<SignupCubit>().togglePasswordVisibility,
          showPassword: widget.context.watch<SignupCubit>().showPassword,
          onChanged: widget.validator,
        ),
      ],
    );
  }
}
