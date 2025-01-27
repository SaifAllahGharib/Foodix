import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';

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
          SizedBox(width: Dimensions.height15(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bazoka",
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height15(context)),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: Dimensions.height20(context),
                  ),
                  SizedBox(width: Dimensions.height10(context) * 0.5),
                  Text(
                    "4.8",
                    style: Styles.textStyle15(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: Dimensions.height10(context) * 0.5),
                  Text(
                    "(245)",
                    style: Styles.textStyle15(context)
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height10(context) * 0.6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: Dimensions.height20(context),
                    color: Colors.grey,
                  ),
                  SizedBox(width: Dimensions.height10(context) * 0.5),
                  Text(
                    "24m",
                    style: Styles.textStyle15(context)
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(width: Dimensions.height10(context) * 0.5),
                  Icon(
                    Icons.circle,
                    size: Dimensions.height10(context) * 0.7,
                    color: Colors.black54,
                  ),
                  SizedBox(width: Dimensions.height10(context) * 0.5),
                  Icon(
                    Icons.motorcycle_outlined,
                    size: Dimensions.height15(context),
                    color: Colors.black54,
                  ),
                  SizedBox(width: Dimensions.height10(context) * 0.5),
                  CustomRowCost(
                    egp: "15.99",
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
