import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';

class CustomButtonAddToCart extends StatelessWidget {
  const CustomButtonAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height20(context),
          vertical: Dimensions.height15(context),
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20(context) * 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add to cart",
              style: Styles.textStyle15(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomRowCost(
              egp: "250",
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
