import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/image_and_back_button.dart';

class TopSectionBottomSheetProduct extends StatelessWidget {
  const TopSectionBottomSheetProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageAndBackButton(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height15(context),
            vertical: Dimensions.height20(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "foodName",
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height15(context)),
              Text(
                "foodDesc",
                style: Styles.textStyle15(context).copyWith(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
