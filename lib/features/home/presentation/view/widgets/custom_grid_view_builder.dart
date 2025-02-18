import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/food_details/presentation/view/food_details_view.dart';

import 'grid_item_view.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final ProductModel productModel;

  const CustomGridViewBuilder({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Dimensions.height10,
        mainAxisSpacing: Dimensions.height10,
        childAspectRatio: Dimensions.screenHeight * 0.00087,
      ),
      padding: EdgeInsets.zero,
      itemCount: productModel.foods!.length,
      itemBuilder: (context, index) {
        return GridItemView(
          index: index,
          productModel: productModel,
          onClick: () {
            GoRouter.of(context).push(FoodDetailsView.id);
          },
        );
      },
    );
  }
}
