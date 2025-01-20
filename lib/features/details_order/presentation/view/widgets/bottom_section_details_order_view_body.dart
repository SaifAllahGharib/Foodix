import 'package:flutter/material.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/custom_item_details_order_section.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/custom_item_list_view_details_order_section.dart';

class BottomSectionDetailsOrderViewBody extends StatelessWidget {
  const BottomSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CustomItemListViewDetailsOrderSection();
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomItemDetailsOrderSection(
                  startText: "Total",
                  endText: "280",
                ),
                CustomItemDetailsOrderSection(
                  startText: "Delivery",
                  endText: "20",
                ),
                CustomItemDetailsOrderSection(
                  startText: "Order total",
                  endText: "300",
                ),
                CustomItemDetailsOrderSection(
                  startText: "Payment",
                  endText: "cash",
                  cashEnabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
