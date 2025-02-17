import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/generated/l10n.dart';

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
      padding: EdgeInsets.only(top: Dimensions.height10),
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
                  ? SizedBox(width: Dimensions.width10)
                  : const SizedBox.shrink(),
              cashEnabled
                  ? Text(
                      S.of(context).foodCost,
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
