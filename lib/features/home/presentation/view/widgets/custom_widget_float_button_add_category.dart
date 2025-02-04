import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';

class CustomWidgetFloatButtonAddCategory extends StatelessWidget {
  final TextEditingController categoryController;

  const CustomWidgetFloatButtonAddCategory({
    super.key,
    required this.categoryController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20(context)),
          topRight: Radius.circular(Dimensions.radius20(context)),
        ),
      ),
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          CustomTextField(
            controller: categoryController,
            hint: "category".tr(context),
            onChanged: (val) {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomButton(
            text: "add".tr(context),
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
