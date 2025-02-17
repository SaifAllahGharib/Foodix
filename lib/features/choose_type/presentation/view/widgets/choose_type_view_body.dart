import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_image.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';
import 'package:yummy_home/generated/l10n.dart';

class ChooseTypeViewBody extends StatelessWidget {
  const ChooseTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height20),
          const CustomBackButton(),
          SizedBox(height: Dimensions.height30),
          CustomImage(
            image: Assets.chooseRole,
            width: Dimensions.width380,
          ),
          const Spacer(),
          CustomText(
            text: S.of(context).chooseType,
            textSize: Dimensions.fontSize30 * 0.8,
          ),
          SizedBox(height: Dimensions.height30),
          CustomButton(
            text: S.of(context).vendor,
            isEnabled: true,
            onClick: () {
              _goToSignup(context, "seller");
            },
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: S.of(context).buyer,
            isEnabled: true,
            onClick: () {
              _goToSignup(context, "buyer");
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _goToSignup(BuildContext context, String type) {
    GoRouter.of(context).pushReplacement(SignupView.id, extra: type);
  }
}
