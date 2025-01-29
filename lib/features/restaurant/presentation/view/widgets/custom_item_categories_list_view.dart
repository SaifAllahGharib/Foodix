import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/category_item.dart';

class CustomItemCategoriesListView extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final int sizeOfList;
  final String text;
  final void Function() onClick;

  const CustomItemCategoriesListView({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.sizeOfList,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        children: [
          CategoryItem(
            text: text,
            selected: selectedIndex == index,
          ),
          SizedBox(
            width:
                index == sizeOfList - 1 ? 0 : Dimensions.width65(context) * 0.3,
          ),
        ],
      ),
    );
  }
}
