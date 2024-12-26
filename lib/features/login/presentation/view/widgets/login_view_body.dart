import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              hint: "hint_email".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              isPassword: true,
              hint: "hint_pass".tr(context),
              onChanged: (val) {},
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
}
