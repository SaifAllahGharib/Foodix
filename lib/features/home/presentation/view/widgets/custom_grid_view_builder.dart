import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/food_details/presentation/view/food_details_view.dart';

import 'grid_item_view.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final String name;
  final String cost;
  final String imageUrl;

  const CustomGridViewBuilder({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Dimensions.height10(context),
        mainAxisSpacing: Dimensions.height10(context),
        childAspectRatio: Dimensions.getHeight(context) * 0.00087,
      ),
      padding: EdgeInsets.zero,
      itemCount: 7,
      itemBuilder: (context, index) {
        return GridItemView(
          foodName: name,
          foodCost: cost,
          imageUrl: imageUrl,
          onClick: () {
            GoRouter.of(context).push(FoodDetailsView.id);
          },
        );
      },
    );
  }
}
