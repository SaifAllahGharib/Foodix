import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_background_image.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_box_of_restaurant_details.dart';

class TopSectionRestaurantView extends StatelessWidget {
  const TopSectionRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height130(context) * 2.15,
      child: Stack(
        children: [
          CustomBackgroundImage(
            image: "assets/images/person.jpg",
            height: Dimensions.height130(context) * 1.6,
          ),
          CustomAppBarRestaurantView(),
          CustomBoxOfRestaurantDetails(),
        ],
      ),
    );
  }
}
