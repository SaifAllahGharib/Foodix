import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_item_details_order.dart';

class InformationPaymentSection extends StatelessWidget {
  const InformationPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height15(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information Payment",
            style: Styles.textStyle18(context),
          ),
          CustomItemDetailsOrder(
            startText: "total_basket".tr(context),
            endText: "250",
          ),
          SizedBox(height: Dimensions.height10(context) * 0.5),
          CustomItemDetailsOrder(
            startText: "delivery".tr(context),
            endText: "20",
          ),
          SizedBox(height: Dimensions.height10(context) * 0.5),
          CustomItemDetailsOrder(
            startText: "total".tr(context),
            endText: "270",
          ),
          SizedBox(height: Dimensions.height20(context)),
        ],
      ),
    );
  }
}
