import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';
import 'package:yummy_home/core/widgets/image_and_back_button.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageAndBackButton(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height15(context),
              vertical: Dimensions.height20(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "foodName",
                  style: Styles.textStyle18(context),
                ),
                SizedBox(height: Dimensions.height15(context)),
                Text(
                  "foodDesc",
                  style:
                      Styles.textStyle15(context).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(Dimensions.height20(context)),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray,
                  spreadRadius: 5,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height10(context) * 0.5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20(context) * 5),
                    border: Border.all(
                      color: AppColors.gray,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: Dimensions.width20(context)),
                      Text(
                        "0",
                        style: Styles.textStyle15(context)
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: Dimensions.width20(context)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Dimensions.width30(context) * 2),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height20(context),
                      vertical: Dimensions.height15(context),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(
                          Dimensions.radius20(context) * 5),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
