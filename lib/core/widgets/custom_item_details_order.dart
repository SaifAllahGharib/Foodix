import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomItemDetailsOrder extends StatelessWidget {
  final String startText;
  final String endText;
  final bool cashEnabled;

  const CustomItemDetailsOrder({
    super.key,
    required this.startText,
    required this.endText,
    this.cashEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            startText,
            style: Styles.textStyle15(context).copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(
                endText,
                style: Styles.textStyle15(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              cashEnabled
                  ? SizedBox(width: Dimensions.width10(context))
                  : const SizedBox.shrink(),
              cashEnabled
                  ? Text(
                      "food_cost".tr(context),
                      style: Styles.textStyle15(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
