import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/restaurant/data/models/Foods.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_bottom_sheet_restaurant_product_widget.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_item_food_category_list_view.dart';

class CustomFoodCategoryListView extends StatelessWidget {
  final List<Foods> listOfFoodCategories;

  const CustomFoodCategoryListView({
    super.key,
    required this.listOfFoodCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.height20(context),
        right: context.read<LocalCubit>().isDirectionRight
            ? Dimensions.height15(context)
            : 0,
        left: context.read<LocalCubit>().isDirectionRight
            ? 0
            : Dimensions.height15(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...listOfFoodCategories.map(
            (food) {
              return CustomItemFoodCategoryListView(
                index: listOfFoodCategories.indexOf(food),
                listOfFood: listOfFoodCategories,
                foodImage: food.image!,
                foodName: food.name!,
                foodDesc: food.desc!,
                foodPrice: food.price!,
                onClickInItem: () {
                  showBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return CustomBottomSheetRestaurantProductWidget(
                        index: listOfFoodCategories.indexOf(food),
                        price: food.price!,
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
