import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/cart/presentation/view/widgets/custom_button_cart_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/restaurant_view.dart';

class BottomSectionCartView extends StatelessWidget {
  const BottomSectionCartView({super.key});

  void _goToRestaurantView(BuildContext context) {
    GoRouter.of(context).pushReplacement(RestaurantView.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height20(context),
        vertical: Dimensions.height15(context),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.gray,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButtonCartView(
            text: "Get Order",
            onClick: () {},
          ),
          SizedBox(width: Dimensions.width30(context) * 1.5),
          CustomButtonCartView(
            text: "Add Products",
            textColor: Colors.black,
            color: Colors.white,
            enableBorder: true,
            onClick: () => _goToRestaurantView(context),
          ),
        ],
      ),
    );
  }
}
