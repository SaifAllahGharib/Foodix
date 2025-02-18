import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/empty_widget.dart';
import 'package:yummy_home/features/add_food/presentation/view/add_food_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_grid_view_builder.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';

class CustomWidgetBottomSheetFloatButtonAddCategory extends StatelessWidget {
  final TextEditingController searchFoodController;
  final ProductModel productModel;

  const CustomWidgetBottomSheetFloatButtonAddCategory({
    super.key,
    required this.searchFoodController,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(height: Dimensions.height20),
          CustomSearchTextField(
            controller: searchFoodController,
            isSeller: true,
            onChange: (value) {},
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            productModel.category!,
            style: Styles.textStyle20(context),
          ),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: Stack(
              children: [
                if (productModel.foods!.isEmpty)
                  const EmptyWidget()
                else
                  CustomGridViewBuilder(productModel: productModel),
                CustomFloatButton(
                  onClick: () => GoRouter.of(context).push(
                    AddFoodView.id,
                    extra: productModel.category,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
