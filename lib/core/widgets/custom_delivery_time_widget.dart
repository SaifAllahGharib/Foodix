import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomDeliveryTimeWidget extends StatelessWidget {
  final int time;

  const CustomDeliveryTimeWidget({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: Dimensions.height20(context),
          color: Colors.grey,
        ),
        SizedBox(width: Dimensions.height10(context) * 0.5),
        Text(
          "$time",
          style: Styles.textStyle15(context).copyWith(color: Colors.grey),
        ),
        SizedBox(width: Dimensions.height10(context) * 0.3),
        Text(
          "minute".tr(context),
          style: Styles.textStyle15(context).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
