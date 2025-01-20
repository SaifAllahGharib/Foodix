import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_details_order_name_image.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';
import 'package:yummy_home/features/details_order/presentation/view/details_order_view.dart';

class BottomSectionCustomItemOrderListView extends StatelessWidget {
  const BottomSectionCustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDetailsOrderNameImage(),
          SizedBox(height: Dimensions.height10(context)),
          CustomRowCost(egp: "280"),
          SizedBox(height: Dimensions.height10(context) * 0.3),
          InkWell(
            onTap: () => GoRouter.of(context).push(DetailsOrderView.id),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            enableFeedback: false,
            child: Text(
              "Details",
              style: Styles.textStyle15(context).copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
