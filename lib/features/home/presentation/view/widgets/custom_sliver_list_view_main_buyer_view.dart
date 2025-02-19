import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/models/restaurant_model.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_sliver_list_view_buyer_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/restaurant_view.dart';

class CustomSliverListViewMainBuyerView extends StatelessWidget {
  final List<RestaurantModel> list;

  const CustomSliverListViewMainBuyerView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return CustomItemSliverListViewBuyerView(
          index: index,
          list: list,
          onClick: () => GoRouter.of(context).push(
            RestaurantView.id,
            extra: {index: list[index]},
          ),
        );
      },
    );
  }
}
