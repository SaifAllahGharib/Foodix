import 'package:flutter/material.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/top_section_restaurant_view.dart';

class RestaurantViewBody extends StatelessWidget {
  const RestaurantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopSectionRestaurantView(),
        Text("data"),
      ],
    );
  }
}
