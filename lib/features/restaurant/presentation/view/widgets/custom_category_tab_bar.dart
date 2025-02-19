import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/restaurant_model.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomCategoryTabBar extends StatelessWidget {
  final TabController tabController;
  final RestaurantModel restaurantModel;
  final void Function(int index) onClickCategory;

  const CustomCategoryTabBar({
    super.key,
    required this.tabController,
    required this.restaurantModel,
    required this.onClickCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        onTap: onClickCategory,
        enableFeedback: false,
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorColor: Colors.black,
        dividerColor: AppColors.gray,
        labelColor: Colors.black,
        labelStyle: Styles.textStyle15(context).copyWith(
          fontWeight: FontWeight.w500,
        ),
        labelPadding: EdgeInsets.symmetric(
          vertical: Dimensions.height10,
          horizontal: Dimensions.width30,
        ),
        tabAlignment: TabAlignment.start,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey,
        indicatorPadding: EdgeInsets.only(
          right: Dimensions.width20,
          left: Dimensions.width20,
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        tabs: List.generate(
          restaurantModel.categories!.length,
          (index) => Text("${restaurantModel.categories![index].category}"),
        ),
      ),
    );
  }
}
