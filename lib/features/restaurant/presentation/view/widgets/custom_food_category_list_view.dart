import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/models/food_model.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_bottom_sheet_restaurant_product_widget.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_item_food_category_list_view.dart';

class CustomFoodCategoryListView extends StatelessWidget {
  final List<FoodModel> listOfFoodCategories;

  const CustomFoodCategoryListView({
    super.key,
    required this.listOfFoodCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.height20,
        right: context.watch<LocalCubit>().isArabic ? Dimensions.height15 : 0,
        left: context.watch<LocalCubit>().isArabic ? 0 : Dimensions.height15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...listOfFoodCategories.map(
            (food) {
              return CustomItemFoodCategoryListView(
                index: listOfFoodCategories.indexOf(food),
                listOfFood: listOfFoodCategories,
                foodImage: food.foodImage!,
                foodName: food.foodName!,
                foodDesc: food.foodDesc!,
                foodPrice: 22,
                onClickInItem: () {
                  showBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return CustomBottomSheetRestaurantProductWidget(
                        index: listOfFoodCategories.indexOf(food),
                        price: 45,
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
