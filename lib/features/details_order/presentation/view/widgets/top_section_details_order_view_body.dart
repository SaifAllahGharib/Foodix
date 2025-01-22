import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_details_order_name_image.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/custom_time_widget.dart';

class TopSectionDetailsOrderViewBody extends StatelessWidget {
  const TopSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDetailsOrderNameImage(customTextDetails: true),
        SizedBox(height: Dimensions.height10(context)),
        CustomTimeWidget(day: "Today", time: "12:30 PM"),
      ],
    );
  }
}
