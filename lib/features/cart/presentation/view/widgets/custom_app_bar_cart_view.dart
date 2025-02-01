import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';

class CustomAppBarCartView extends StatelessWidget {
  const CustomAppBarCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Dimensions.height10(context),
        top: Dimensions.height20(context),
        left: Dimensions.height10(context),
        bottom: Dimensions.height10(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          CustomBackButton(),
          SizedBox(width: Dimensions.width30(context) * 1.5),
          Column(
            children: [
              Text(
                "cart".tr(context),
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height10(context) * 0.5),
              Text(
                "Bazoka".tr(context),
                style: Styles.textStyle12(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
