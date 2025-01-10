import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';

class ChooseTypeViewBody extends StatelessWidget {
  const ChooseTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45(context) * 3),
          CustomText(text: "choose_type".tr(context)),
          SizedBox(height: Dimensions.height45(context) * 7),
          CustomButton(
            text: "عربي",
            isEnabled: true,
            onClick: () {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomButton(
            text: "English",
            isEnabled: true,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
