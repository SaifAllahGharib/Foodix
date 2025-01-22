import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class TopSectionCustomItemOrderListView extends StatelessWidget {
  const TopSectionCustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height10(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: Styles.textStyle15(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: Dimensions.width10(context)),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: Dimensions.width10(context) * 1.2,
              ),
              SizedBox(width: Dimensions.width10(context)),
              Text(
                "12:30 PM",
                style: Styles.textStyle15(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10(context),
              horizontal: Dimensions.height20(context),
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteGray,
              borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
            ),
            child: Text(
              "completed".tr(context),
              style: Styles.textStyle15(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
