import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/restaurant_model.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_background_image.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_box_of_restaurant_details.dart';

class TopSectionRestaurantView extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const TopSectionRestaurantView({super.key, required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height130 * 2.15,
      child: Stack(
        children: [
          CustomBackgroundImage(
            image: Assets.food,
            height: Dimensions.height130 * 1.6,
          ),
          CustomBoxOfRestaurantDetails(restaurantModel: restaurantModel),
        ],
      ),
    );
  }
}
