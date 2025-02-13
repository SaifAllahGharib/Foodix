import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/cart/presentation/view/widgets/custom_item_list_view_cart_view.dart';

class CustomListViewCartView extends StatelessWidget {
  const CustomListViewCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.height15),
        child: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomItemListViewCartView(index: index);
          },
        ),
      ),
    );
  }
}
