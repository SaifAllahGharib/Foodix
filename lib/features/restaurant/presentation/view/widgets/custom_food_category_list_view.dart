import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_bottom_sheet_widget.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_item_food_category_list_view.dart';

class CustomFoodCategoryListView extends StatelessWidget {
  const CustomFoodCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: Dimensions.height20(context),
        right: context.read<LocalCubit>().isDirectionRight
            ? Dimensions.height15(context)
            : 0,
        left: context.read<LocalCubit>().isDirectionRight
            ? 0
            : Dimensions.height15(context),
      ),
      sliver: SliverList.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return CustomItemFoodCategoryListView(
            index: index,
            foodImage: "assets/images/person.jpg",
            foodName: "Chiken",
            foodDesc: "meet, salat, tehena",
            foodCost: "280",
            onClickInItem: () {
              showBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                builder: (context) {
                  return CustomBottomSheetWidget();
                },
              );
            },
          );
        },
      ),
    );
  }
}
