import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_widget_bottom_sheet_float_button_add_category.dart';

class CustomItemCategorySellerListView extends StatelessWidget {
  final int index;
  final List<ProductModel> list;
  final TextEditingController searchFoodController;

  const CustomItemCategorySellerListView({
    super.key,
    required this.index,
    required this.list,
    required this.searchFoodController,
  });

  void _showBottomSheetOnTabListTile(BuildContext context, int index) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return CustomWidgetBottomSheetFloatButtonAddCategory(
          searchFoodController: searchFoodController,
          productModel: list[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showBottomSheetOnTabListTile(context, index),
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${list[index].category}",
            style: Styles.textStyle18(context),
          ),
          if (index != list.length - 1) SizedBox(height: Dimensions.height20),
          if (index != list.length - 1)
            const Divider(
              height: 1,
              color: AppColors.gray,
            ),
          if (index != list.length - 1) SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
}
