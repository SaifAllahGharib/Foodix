import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/food_details/presentation/view/widgets/custom_bottom_bar.dart';
import 'package:yummy_home/features/food_details/presentation/view/widgets/custom_radio_list_tile.dart';
import 'package:yummy_home/features/food_details/presentation/view/widgets/food_name_and_desc.dart';
import 'package:yummy_home/features/food_details/presentation/view/widgets/image_and_back_button.dart';

class FoodDetailsViewBody extends StatefulWidget {
  const FoodDetailsViewBody({super.key});

  @override
  State<FoodDetailsViewBody> createState() => _FoodDetailsViewBodyState();
}

class _FoodDetailsViewBodyState extends State<FoodDetailsViewBody> {
  String _selectedValue = "single";

  void _updateState(String value) {
    _selectedValue = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageAndBackButton(),
        FoodNameAndDesc(),
        SizedBox(height: Dimensions.height10(context)),
        Column(
          children: [
            CustomRadioListTile(
              title: "Single",
              value: "single",
              groupValue: _selectedValue,
              onChanged: (value) => _updateState(value),
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomRadioListTile(
              title: "Double",
              value: "double",
              groupValue: _selectedValue,
              onChanged: (value) => _updateState(value),
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomRadioListTile(
              title: "Triple",
              value: "triple",
              groupValue: _selectedValue,
              onChanged: (value) => _updateState(value),
            ),
          ],
        ),
        Spacer(),
        CustomBottomBar(),
      ],
    );
  }
}
