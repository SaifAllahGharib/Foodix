import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/is_valid_email.dart';
import 'package:yummy_home/core/utils/functions/is_valid_phone.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/or_widget.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/user_type.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController type = TextEditingController();
  bool isEnabled = false;
  String? userType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height45(context)),
            CustomText(text: "create_account".tr(context)),
            SizedBox(height: Dimensions.height45(context) * 2),
            CustomTextField(
              controller: name,
              hint: "hint_name".tr(context),
              onChanged: (val) => _validateInputs(),
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              controller: email,
              hint: "hint_email".tr(context),
              onChanged: (val) => _validateInputs(),
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              controller: phone,
              hint: "hint_phone".tr(context),
              onChanged: (val) => _validateInputs(),
            ),
            SizedBox(height: Dimensions.height15(context)),
            UserType(
              type: userType,
              onChange: (val) {
                userType = val;
                _validateInputs();
              },
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              controller: password,
              isPassword: true,
              hint: "hint_pass".tr(context),
              onChanged: (val) => _validateInputs(),
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomSignupButton(
              text: "signup".tr(context),
              isEnabled: isEnabled,
              onClick: () {},
            ),
            SizedBox(height: Dimensions.height30(context)),
            Or(),
            SizedBox(height: Dimensions.height20(context)),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                Assets.google,
                width: Dimensions.iconSize45(context),
              ),
            ),
            SizedBox(height: Dimensions.height20(context)),
            CustomTextButton(
              text: "already_have_account".tr(context),
              onClick: () {
                GoRouter.of(context).push(LoginView.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validateInputs() {
    setState(() {
      isEnabled = name.text.isNotEmpty &&
          email.text.isNotEmpty &&
          phone.text.isNotEmpty &&
          password.text.isNotEmpty &&
          isValidEmail(email.text) &&
          isValidPhone(phone.text) &&
          userType!.isNotEmpty;
    });
  }
}
