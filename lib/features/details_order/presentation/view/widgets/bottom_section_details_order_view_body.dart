import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/widgets/custom_item_details_order.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/custom_item_list_view_details_order_section.dart';

class BottomSectionDetailsOrderViewBody extends StatelessWidget {
  const BottomSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return const CustomItemListViewDetailsOrderSection();
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomItemDetailsOrder(
                  startText: "total".tr(context),
                  endText: "280",
                ),
                CustomItemDetailsOrder(
                  startText: "delivery".tr(context),
                  endText: "20",
                ),
                CustomItemDetailsOrder(
                  startText: "order_total".tr(context),
                  endText: "300",
                ),
                CustomItemDetailsOrder(
                  startText: "payment".tr(context),
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
