import 'package:flutter/material.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_sliver_list_view_buyer_view.dart';

class CustomSliverListViewMainBuyerView extends StatelessWidget {
  const CustomSliverListViewMainBuyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 11,
      itemBuilder: (context, index) {
        return CustomItemSliverListViewBuyerView();
      },
    );
  }
}
