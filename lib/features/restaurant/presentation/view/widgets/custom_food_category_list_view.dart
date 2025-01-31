import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_bottom_sheet_widget.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_item_food_category_list_view.dart';

class CustomFoodCategoryListView extends StatelessWidget {
  final List<Map<String, dynamic>> listOfFoodCategories;

  const CustomFoodCategoryListView({
    super.key,
    required this.listOfFoodCategories,
  });

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
        itemCount: listOfFoodCategories.length,
        itemBuilder: (context, index) {
          final category = listOfFoodCategories[index];
          final categoryName = category["category"];
          final foods = category["foods"];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height15(context),
                ),
                child: Text(
                  categoryName,
                  style: Styles.textStyle18(context),
                ),
              ),
              ...foods.map(
                (food) {
                  return CustomItemFoodCategoryListView(
                    index: foods.indexOf(food),
                    listOfFood: foods,
                    foodImage: food["image"],
                    foodName: food["name"],
                    foodDesc: food["desc"],
                    foodCost: food["price"],
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
            ],
          );
        },
      ),
    );
  }
}
