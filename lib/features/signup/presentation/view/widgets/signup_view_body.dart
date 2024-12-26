import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45(context)),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "signup".tr(context),
              style: Styles.textStyle20(context),
            ),
          ),
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
          MaterialButton(
            onPressed: () {},
            height: Dimensions.height45(context),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width120(context),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
            ),
            textColor: Colors.white,
            color: AppColors.primaryColor,
            child: Text(
              "signup".tr(context),
              style: TextStyle(fontSize: Dimensions.fontSize15(context)),
            ),
          ),
          SizedBox(height: Dimensions.height30(context)),
          Row(
            children: [
              Expanded(
                child: Divider(thickness: 2),
              ),
              SizedBox(width: 7),
              Text(
                "or".tr(context),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.fontSize15(context),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Divider(thickness: 2),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height20(context)),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              Assets.google,
              width: Dimensions.iconSize45(context),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "already_have_account".tr(context),
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.fontSize15(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
