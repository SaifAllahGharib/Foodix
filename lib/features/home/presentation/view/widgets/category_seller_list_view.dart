import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_category_seller_list_view.dart';

class CategorySellerListView extends StatelessWidget {
  final List<ProductModel> list;
  final TextEditingController searchFoodController;

  const CategorySellerListView({
    super.key,
    required this.list,
    required this.searchFoodController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CustomItemCategorySellerListView(
            searchFoodController: searchFoodController,
            index: index,
            list: list,
          );
        },
      ),
    );
  }
}
