import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/generated/l10n.dart';

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
          topLeft: Radius.circular(Dimensions.radius20),
          topRight: Radius.circular(Dimensions.radius20),
        ),
      ),
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          CustomTextField(
            controller: categoryController,
            hint: S.of(context).category,
            onChanged: (val) {},
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: S.of(context).add,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
