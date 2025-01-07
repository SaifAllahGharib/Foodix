import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/custom_back_button.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';
import 'package:yummy_home/features/verification/presentation/view/verification_view.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height20(context)),
            CustomBackButton(
              onPressed: () => GoRouter.of(context).go(LoginView.id),
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomText(text: "re_password".tr(context)),
            SizedBox(height: Dimensions.height45(context) * 2),
            CustomTextField(
              controller: _email,
              hint: "hint_email".tr(context),
              onChanged: (val) => {},
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomSignupButton(
              text: "verify".tr(context),
              isEnabled: true,
              onClick: () {
                GoRouter.of(context)
                    .go(VerificationView.id, extra: "saif@dfg.dfg");
              },
            ),
          ],
        ),
      ),
    );
  }
}
