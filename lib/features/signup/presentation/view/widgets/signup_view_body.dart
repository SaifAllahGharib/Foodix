import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/or_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height45(context)),
            CustomText(text: "signup".tr(context)),
            SizedBox(height: Dimensions.height45(context) * 2),
            CustomTextField(
              hint: "hint_name".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              hint: "hint_email".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              hint: "hint_phone".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height15(context)),
            CustomTextField(
              isPassword: true,
              hint: "hint_pass".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomSignupButton(
              text: "signup".tr(context),
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
}
