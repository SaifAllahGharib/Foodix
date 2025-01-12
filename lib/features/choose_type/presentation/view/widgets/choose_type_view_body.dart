import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';

class ChooseTypeViewBody extends StatelessWidget {
  const ChooseTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45(context)),
          Image.asset(
            "assets/images/choose_type.jpeg",
            width: Dimensions.width380(context),
          ),
          Spacer(),
          CustomText(
            text: "choose_type".tr(context),
            textSize: Dimensions.fontSize30(context) * 0.8,
          ),
          SizedBox(height: Dimensions.height30(context)),
          CustomButton(
            text: "vendor".tr(context),
            isEnabled: true,
            onClick: () {
              _goToSignup(context, "seller");
            },
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomButton(
            text: "buyer".tr(context),
            isEnabled: true,
            onClick: () {
              _goToSignup(context, "buyer");
            },
          ),
          Spacer(),
        ],
      ),
    );
  }

  void _goToSignup(BuildContext context, String type) {
    GoRouter.of(context).go(SignupView.id, extra: type);
  }
}
