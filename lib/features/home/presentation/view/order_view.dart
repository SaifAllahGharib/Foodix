import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_order_list_view.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height20(context) * 2,
        right: Dimensions.height20(context),
        left: Dimensions.height20(context),
      ),
      child: ListView.builder(
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CustomItemOrderListView();
        },
      ),
    );
  }
}
