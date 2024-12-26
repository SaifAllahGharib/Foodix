import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/is_valid_email.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height20(context)),
            Align(
              alignment: locale.languageCode == "ar"
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  _goSignup(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: Dimensions.iconSize24(context),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomText(text: "login".tr(context)),
            SizedBox(height: Dimensions.height45(context) * 2),
            CustomTextField(
              controller: email,
              hint: "hint_email".tr(context),
              onChanged: (val) => _validateInputs(),
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              controller: password,
              isPassword: true,
              hint: "hint_pass".tr(context),
              onChanged: (val) => _validateInputs(),
            ),
            SizedBox(height: Dimensions.height10(context)),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomTextButton(
                text: "forget_pass".tr(context),
                onClick: () {},
              ),
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomSignupButton(
              text: "login".tr(context),
              isEnabled: isEnabled,
              onClick: () {},
            ),
            SizedBox(height: Dimensions.height20(context)),
            CustomTextButton(
              text: "not_have_account".tr(context),
              color: Colors.black,
              onClick: () {
                _goSignup(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _goSignup(BuildContext context) {
    GoRouter.of(context).go(SignupView.id);
  }

  void _validateInputs() {
    setState(() {
      isEnabled = email.text.isNotEmpty &&
          password.text.isNotEmpty &&
          isValidEmail(email.text);
    });
  }
}
