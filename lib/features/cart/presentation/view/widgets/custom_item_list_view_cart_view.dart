import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/counter_product_widget.dart';
import 'package:yummy_home/core/widgets/custom_food_image.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';
import 'package:yummy_home/features/cart/presentation/viewmodel/cubits/cart/cart_cubit.dart';

class CustomItemListViewCartView extends StatelessWidget {
  final int index;

  const CustomItemListViewCartView({
    super.key,
    required this.index,
  });

  void _incrementCountOfProducts(BuildContext context, int index) {
    context.read<CartCubit>().incrementCountOfProducts(index);
  }

  void _decrementCountOfProducts(BuildContext context, int index) {
    context.read<CartCubit>().decrementCountOfProducts(index);
  }

  int _getCountOfProducts(BuildContext context, int index) {
    return context.watch<CartCubit>().countOfProducts(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height15(context)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomFoodImage(
                image: "assets/images/person.jpg",
                width: Dimensions.height130(context) * 0.8,
                height: Dimensions.height130(context) * 0.8,
              ),
              SizedBox(width: Dimensions.height20(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chekin",
                    style: Styles.textStyle15(context)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: Dimensions.height30(context)),
                  const CustomRowCost(
                    egp: "250",
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(),
              CounterProductWidget(
                increment: () => _incrementCountOfProducts(context, index),
                decrement: () => _decrementCountOfProducts(context, index),
                count: _getCountOfProducts(context, index),
                isCart: true,
              ),
            ],
          ),
          if (index != 4) SizedBox(height: Dimensions.height15(context)),
          if (index != 4)
            const Divider(
              height: 1,
              color: AppColors.gray,
            ),
        ],
      ),
    );
  }
}
