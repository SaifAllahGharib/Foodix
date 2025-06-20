import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';

class CustomItemDatesOrdersListView extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final List<String> list;

  const CustomItemDatesOrdersListView({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.list,
  });

  void _setSelectedIndex(BuildContext context, int index) {
    context.read<OrdersCubit>().selectDayTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => _setSelectedIndex(context, index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width30 * 2),
        margin: EdgeInsets.only(right: Dimensions.width30),
        decoration: BoxDecoration(
          color: selectedIndex == index ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
          border: Border.all(
            width: 1,
            color: AppColors.primaryColor,
          ),
        ),
        child: Center(
          child: Text(
            list[index],
            style: Styles.textStyle16(context).copyWith(
              color: selectedIndex == index
                  ? Colors.white
                  : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
