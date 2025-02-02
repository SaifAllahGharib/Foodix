import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_item_categories_list_view.dart';

class CustomCategoryListView extends StatefulWidget {
  final List<ProductModel> list;
  final int selectedIndex;
  final void Function(int index) onClickInItem;

  const CustomCategoryListView({
    super.key,
    required this.list,
    required this.selectedIndex,
    required this.onClickInItem,
  });

  @override
  State<CustomCategoryListView> createState() => _CustomCategoryListViewState();
}

class _CustomCategoryListViewState extends State<CustomCategoryListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedIndex(widget.selectedIndex);
    });
  }

  void _scrollToSelectedIndex(int index) {
    if (!mounted || !_scrollController.hasClients) return;

    double itemWidth = Dimensions.width120(context) * 0.75;
    double screenWidth = MediaQuery.of(context).size.width;
    double targetOffset = index * itemWidth;

    double maxScrollExtent = _scrollController.position.maxScrollExtent;

    double adjustedOffset = (targetOffset - (screenWidth / 2) + (itemWidth / 2))
        .clamp(0, maxScrollExtent);

    _scrollController.animateTo(
      adjustedOffset,
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeInOut,
    );
  }

  void _onClickInItem(int index) {
    widget.onClickInItem(index);
    _scrollToSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45(context) * 0.98,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Dimensions.height20(context)),
      padding: EdgeInsets.only(
        left: Dimensions.height10(context) * 0.6,
        right: Dimensions.height10(context) * 0.6,
        top: Dimensions.height10(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray,
            spreadRadius: -8,
            blurRadius: 6,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.list.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomItemCategoriesListView(
            onClick: () => _onClickInItem(index),
            categoryName: widget.list[index].category ?? "",
            sizeOfList: widget.list.length,
            index: index,
            selectedIndex: widget.selectedIndex,
          );
        },
      ),
    );
  }
}
