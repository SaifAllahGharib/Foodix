import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/models/food_model.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/widgets/custom_cashed_network_image.dart';
import 'package:yummy_home/core/widgets/custom_food_image.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';

class CustomItemFoodCategoryListView extends StatefulWidget {
  final FoodModel foodModel;
  final int index;
  final List listOfFood;
  final void Function() onClickInItem;

  const CustomItemFoodCategoryListView({
    super.key,
    required this.index,
    required this.foodModel,
    required this.listOfFood,
    required this.onClickInItem,
  });

  @override
  State<CustomItemFoodCategoryListView> createState() =>
      _CustomItemFoodCategoryListViewState();
}

class _CustomItemFoodCategoryListViewState
    extends State<CustomItemFoodCategoryListView> {
  bool get isArabic => context.watch<LocalCubit>().isArabic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClickInItem,
      enableFeedback: false,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: Dimensions.height130,
            padding: EdgeInsets.only(
              bottom: Dimensions.height15,
              right: isArabic ? 0 : Dimensions.height20,
              left: isArabic ? Dimensions.height20 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  child: CustomCashedNetworkImage(
                    width: Dimensions.height130 * 0.9,
                    height: Dimensions.height130 * 0.9,
                    imageURL: widget.foodModel.foodImage,
                    placeholder: Assets.food,
                  ),
                ),
                SizedBox(width: Dimensions.width30 * 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.foodModel.foodName,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16(context),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Expanded(
                        child: Text(
                          widget.foodModel.foodDesc,
                          softWrap: true,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle12(context),
                        ),
                      ),
                      const Spacer(),
                      CustomRowCost(
                        egp: widget.foodModel.foodPrice,
                        fontWeight: FontWeight.w600,
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (widget.index != widget.listOfFood.length - 1)
            const Divider(
              height: 1,
              color: AppColors.gray,
            ),
          if (widget.index != widget.listOfFood.length - 1)
            SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
}
