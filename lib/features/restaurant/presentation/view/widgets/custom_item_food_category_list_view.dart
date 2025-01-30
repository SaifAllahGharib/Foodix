import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';

class CustomItemFoodCategoryListView extends StatelessWidget {
  const CustomItemFoodCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.read<LocalCubit>().isDirectionRight
            ? Dimensions.height15(context)
            : 0,
        left: context.read<LocalCubit>().isDirectionRight
            ? 0
            : Dimensions.height15(context),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: Dimensions.height130(context),
            padding: EdgeInsets.only(
              bottom: Dimensions.height10(context),
              right: Dimensions.height20(context),
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
                      image: AssetImage("assets/images/person.jpg"),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Chekin",
                      style: Styles.textStyle16(context),
                    ),
                    SizedBox(height: Dimensions.height10(context)),
                    Text(
                      "meet, salat, tehena",
                      style: Styles.textStyle12(context),
                    ),
                    Spacer(),
                    CustomRowCost(
                      egp: "280",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: AppColors.gray,
          ),
          SizedBox(height: Dimensions.height20(context)),
        ],
      ),
    );
  }
}
