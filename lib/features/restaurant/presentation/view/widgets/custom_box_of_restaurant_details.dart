import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_cost_delivery.dart';
import 'package:yummy_home/core/widgets/custom_delivery_time_widget.dart';
import 'package:yummy_home/core/widgets/custom_dot_widget.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/image_and_name_and_rating_widget.dart';

class CustomBoxOfRestaurantDetails extends StatelessWidget {
  const CustomBoxOfRestaurantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height130(context) * 0.92,
      left: 0,
      right: 0,
      child: Container(
        height: Dimensions.height130(context) * 1.1,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: Dimensions.height15(context),
          right: Dimensions.height15(context),
          left: Dimensions.height15(context),
        ),
        margin:
            EdgeInsets.symmetric(horizontal: Dimensions.width30(context) * 1.2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAndNameAndRatingWidget(),
            SizedBox(height: Dimensions.height15(context)),
            Row(
              children: [
                CustomDeliveryTimeWidget(time: 24),
                SizedBox(width: Dimensions.width15(context)),
                CustomDotWidget(),
                SizedBox(width: Dimensions.width15(context)),
                CustomCostDelivery(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
