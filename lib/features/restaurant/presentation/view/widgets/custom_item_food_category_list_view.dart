import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';

class CustomItemFoodCategoryListView extends StatelessWidget {
  final int index;
  final String foodName;
  final String foodDesc;
  final String foodCost;
  final String foodImage;
  final List listOfFood;
  final void Function() onClickInItem;

  const CustomItemFoodCategoryListView({
    super.key,
    required this.index,
    required this.foodName,
    required this.foodDesc,
    required this.foodCost,
    required this.foodImage,
    required this.listOfFood,
    required this.onClickInItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickInItem,
      enableFeedback: false,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: Dimensions.height130(context),
            padding: EdgeInsets.only(
              bottom: Dimensions.height15(context),
              right: context.read<LocalCubit>().isDirectionRight
                  ? 0
                  : Dimensions.height20(context),
              left: context.read<LocalCubit>().isDirectionRight
                  ? Dimensions.height20(context)
                  : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Dimensions.height130(context) * 0.9,
                  height: Dimensions.height130(context) * 0.9,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20(context)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(foodImage),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      foodName,
                      style: Styles.textStyle16(context),
                    ),
                    SizedBox(height: Dimensions.height10(context)),
                    Text(
                      foodDesc,
                      style: Styles.textStyle12(context),
                    ),
                    Spacer(),
                    CustomRowCost(
                      egp: foodCost,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (index != listOfFood.length - 1)
            Divider(
              height: 1,
              color: AppColors.gray,
            ),
          if (index != listOfFood.length - 1)
            SizedBox(height: Dimensions.height20(context)),
        ],
      ),
    );
  }
}
