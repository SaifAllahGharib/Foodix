import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';

class AddFoodViewBody extends StatefulWidget {
  const AddFoodViewBody({super.key});

  @override
  State<AddFoodViewBody> createState() => _AddFoodViewBodyState();
}

class _AddFoodViewBodyState extends State<AddFoodViewBody> {
  late final TextEditingController _foodName;
  late final TextEditingController _foodDesc;
  late final TextEditingController _foodCost;

  @override
  void initState() {
    _foodName = TextEditingController();
    _foodDesc = TextEditingController();
    _foodCost = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45(context)),
          CustomTextField(
            controller: _foodName,
            hint: "food_name".tr(context),
            onChanged: (val) {},
          ),
          SizedBox(height: Dimensions.height10(context)),
          CustomTextField(
            controller: _foodName,
            hint: "food_desc".tr(context),
            onChanged: (val) {},
          ),
          SizedBox(height: Dimensions.height10(context)),
          CustomTextField(
            controller: _foodName,
            hint: "food_cost".tr(context),
            onChanged: (val) {},
          ),
          SizedBox(height: Dimensions.height30(context)),
          CustomButton(
            text: "add".tr(context),
            isEnabled: true,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
