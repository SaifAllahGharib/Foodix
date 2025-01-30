import 'package:flutter/material.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_item_food_category_list_view.dart';

class CustomFoodCategoryListView extends StatelessWidget {
  const CustomFoodCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 12,
      itemBuilder: (context, index) {
        return CustomItemFoodCategoryListView();
      },
    );
  }
}
