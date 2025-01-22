import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomItemProfileView extends StatelessWidget {
  final String title;
  final void Function() onClick;
  final bool dividerIsShowing;

  const CustomItemProfileView({
    super.key,
    required this.title,
    required this.onClick,
    this.dividerIsShowing = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.height20(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Styles.textStyle18(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 28,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.height10(context)),
          dividerIsShowing
              ? Padding(
                  padding: EdgeInsets.only(right: Dimensions.height20(context)),
                  child: Divider(
                    height: 1,
                    color: AppColors.gray,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
