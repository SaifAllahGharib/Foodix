import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/restaurant_model.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_food_category_list_view.dart';

class CustomRestaurantProductList extends StatelessWidget {
  final RestaurantModel restaurantModel;
  final List<GlobalKey> keys;

  const CustomRestaurantProductList({
    super.key,
    required this.restaurantModel,
    required this.keys,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        restaurantModel.categories?.length ?? 0,
        (index) {
          return Column(
            key: keys[index],
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height15,
                  horizontal: Dimensions.height20,
                ),
                child: Text(
                  "${restaurantModel.categories?[index].category}",
                  style: Styles.textStyle18(context),
                ),
              ),
              CustomFoodCategoryListView(
                index: index,
                restaurantModel: restaurantModel,
              ),
            ],
          );
        },
      ),
    );
  }
}
