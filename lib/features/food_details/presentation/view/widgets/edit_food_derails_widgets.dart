import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_divider.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';

class EditFoodDerailsWidgets extends StatefulWidget {
  const EditFoodDerailsWidgets({super.key});

  @override
  State<EditFoodDerailsWidgets> createState() => _EditFoodDerailsWidgetsState();
}

class _EditFoodDerailsWidgetsState extends State<EditFoodDerailsWidgets> {
  late final TextEditingController _nameFood;
  late final TextEditingController _descFood;
  late final TextEditingController _costFood;

  @override
  void initState() {
    _nameFood = TextEditingController();
    _descFood = TextEditingController();
    _costFood = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameFood.dispose();
    _descFood.dispose();
    _costFood.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height130(context) * 5,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height10(context),
          right: Dimensions.height20(context),
          bottom: Dimensions.height20(context),
          left: Dimensions.height20(context),
        ),
        child: Column(
          children: [
            const CustomDivider(),
            SizedBox(height: Dimensions.height45(context)),
            CustomTextField(
              controller: _nameFood,
              hint: "food_name".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomTextField(
              controller: _descFood,
              hint: "food_desc".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomTextField(
              controller: _costFood,
              hint: "food_cost".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomButton(
              text: "edit".tr(context),
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
