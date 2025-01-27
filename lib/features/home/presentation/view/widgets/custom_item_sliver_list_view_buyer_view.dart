import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomItemSliverListViewBuyerView extends StatelessWidget {
  const CustomItemSliverListViewBuyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10(context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
        color: AppColors.whiteGray,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.height130(context),
            height: Dimensions.height130(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20(context)),
                bottomLeft: Radius.circular(Dimensions.radius20(context)),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/person.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
