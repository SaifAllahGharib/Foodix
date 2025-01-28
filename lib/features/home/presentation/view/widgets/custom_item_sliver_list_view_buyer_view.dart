import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_cost_delivery.dart';
import 'package:yummy_home/core/widgets/custom_delivery_time_widget.dart';
import 'package:yummy_home/core/widgets/custom_dot_widget.dart';
import 'package:yummy_home/core/widgets/custom_rating_widget.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_image_item_sliver_list_view_buyer_view.dart';

class CustomItemSliverListViewBuyerView extends StatelessWidget {
  final void Function() onClick;

  const CustomItemSliverListViewBuyerView({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.height10(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
          color: AppColors.whiteGray,
        ),
        child: Row(
          children: [
            CustomImageItemSliverListViewBuyerView(),
            SizedBox(width: Dimensions.height15(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bazoka",
                  style: Styles.textStyle18(context),
                ),
                SizedBox(height: Dimensions.height15(context)),
                CustomRatingWidget(
                  rating: 4.8,
                  ratingCount: 265,
                ),
                SizedBox(height: Dimensions.height10(context) * 0.6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDeliveryTimeWidget(time: 24),
                    SizedBox(width: Dimensions.height10(context) * 0.5),
                    CustomDotWidget(),
                    SizedBox(width: Dimensions.height10(context) * 0.5),
                    CustomCostDelivery(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
