import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/counter_product_widget.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_button_add_to_cart.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_cubit.dart';

class BottomSectionBottomSheetProduct extends StatelessWidget {
  final int index;
  final double price;

  const BottomSectionBottomSheetProduct({
    super.key,
    required this.index,
    required this.price,
  });

  void _incrementCountOfProduct(BuildContext context, int index) {
    context.read<RestaurantCubit>().incrementCountOfProduct(index);
  }

  void _decrementCountOfProduct(BuildContext context, int index) {
    context.read<RestaurantCubit>().decrementCountOfProduct(index);
  }

  int getCountOfProduct(BuildContext context, int index) {
    return context.watch<RestaurantCubit>().countOfProducts(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray,
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CounterProductWidget(
            increment: () => _incrementCountOfProduct(context, index),
            decrement: () => _decrementCountOfProduct(context, index),
            count: getCountOfProduct(context, index),
          ),
          SizedBox(width: Dimensions.width30(context)),
          CustomButtonAddToCart(
            price: price * getCountOfProduct(context, index),
          ),
        ],
      ),
    );
  }
}
