import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';

class CustomAppBarRestaurantView extends StatelessWidget {
  const CustomAppBarRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45(context) * 1.5,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width30(context),
        vertical: Dimensions.height15(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackButton(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: Dimensions.iconSize24(context),
            ),
          ),
        ],
      ),
    );
  }
}
