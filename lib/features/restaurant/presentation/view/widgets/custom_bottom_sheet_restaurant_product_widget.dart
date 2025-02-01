import 'package:flutter/material.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/bottom_section_bottom_sheet_product.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/top_section_bottom_sheet_product.dart';

class CustomBottomSheetRestaurantProductWidget extends StatelessWidget {
  final int index;

  const CustomBottomSheetRestaurantProductWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSectionBottomSheetProduct(),
          Spacer(),
          BottomSectionBottomSheetProduct(index: index),
        ],
      ),
    );
  }
}
