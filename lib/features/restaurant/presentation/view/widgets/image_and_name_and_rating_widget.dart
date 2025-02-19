import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/restaurant_model.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_rating_widget.dart';

class ImageAndNameAndRatingWidget extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const ImageAndNameAndRatingWidget({super.key, required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.height80 * 0.9,
          height: Dimensions.height80 * 0.9,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(Assets.food),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
        ),
        SizedBox(width: Dimensions.width20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurantModel.name,
              style: Styles.textStyle16(context),
            ),
            SizedBox(height: Dimensions.height10 * 0.2),
            Text(
              "${restaurantModel.desc}",
              style: Styles.textStyle12(context),
            ),
            SizedBox(height: Dimensions.height10 * 0.2),
            CustomRatingWidget(
              rating: restaurantModel.rates,
              ratingCount: restaurantModel.countRates,
            ),
          ],
        ),
      ],
    );
  }
}
