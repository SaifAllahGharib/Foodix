import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_category_list_view.dart';

class CustomAppBarRestaurantView extends StatelessWidget {
  final double opacity;
  final List<ProductModel> list;
  final int selectedIndex;
  final double appBarHeight;
  final void Function(int index) onClickInItem;

  const CustomAppBarRestaurantView({
    super.key,
    required this.opacity,
    required this.list,
    required this.selectedIndex,
    required this.appBarHeight,
    required this.onClickInItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 50),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            boxShadow: opacity >= 0.5
                ? [
                    BoxShadow(
                      color: AppColors.gray,
                      blurRadius: 10,
                      spreadRadius: 0.8,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          height: Dimensions.height45(context) * 1.85,
          padding: EdgeInsets.only(
            left: Dimensions.width30(context),
            right: Dimensions.width30(context),
            top: Dimensions.height20(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),
              Container(
                width: Dimensions.height45(context),
                height: Dimensions.height45(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5000),
                  border: Border.all(
                    color: AppColors.gray,
                    width: 1,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  enableFeedback: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.search_rounded,
                    size: Dimensions.iconSize24(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (appBarHeight >= Dimensions.height45(context) * 4)
          Divider(
            height: 1,
            color: AppColors.gray,
          ),
        if (appBarHeight >= Dimensions.height45(context) * 4)
          CustomCategoryListView(
            selectedIndex: selectedIndex,
            list: list,
            onClickInItem: onClickInItem,
          ),
      ],
    );
  }
}
