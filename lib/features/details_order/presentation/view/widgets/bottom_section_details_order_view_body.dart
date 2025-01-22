import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
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
            itemCount: 7,
            itemBuilder: (context, index) {
              return CustomItemListViewDetailsOrderSection();
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomItemDetailsOrderSection(
                  startText: "total".tr(context),
                  endText: "280",
                ),
                CustomItemDetailsOrderSection(
                  startText: "delivery".tr(context),
                  endText: "20",
                ),
                CustomItemDetailsOrderSection(
                  startText: "order_total".tr(context),
                  endText: "300",
                ),
                CustomItemDetailsOrderSection(
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
