import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';

class CustomAppBarRestaurantView extends StatelessWidget {
  const CustomAppBarRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45(context) * 1.85,
      padding: EdgeInsets.only(
        left: Dimensions.width30(context),
        right: Dimensions.width30(context),
        top: Dimensions.height20(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackButton(),
          Container(
            width: Dimensions.height45(context),
            height: Dimensions.height45(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5000),
              border: Border.all(
                color: AppColors.gray,
                width: 1,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              enableFeedback: false,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.search_rounded,
                size: Dimensions.iconSize24(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
