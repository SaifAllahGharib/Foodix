import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_food_category_list_view.dart';

class CustomRestaurantProductList extends StatelessWidget {
  final List<ProductModel> listOfFoodCategories;
  final List<GlobalKey> keys;

  const CustomRestaurantProductList({
    super.key,
    required this.listOfFoodCategories,
    required this.keys,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        listOfFoodCategories.length,
        (index) {
          return Column(
            key: keys[index],
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height15(context),
                  horizontal: Dimensions.height20(context),
                ),
                child: Text(
                  listOfFoodCategories[index].category!,
                  style: Styles.textStyle18(context),
                ),
              ),
              CustomFoodCategoryListView(
                listOfFoodCategories: listOfFoodCategories[index].foods ?? [],
              ),
            ],
          );
        },
      ),
    );
  }
}
