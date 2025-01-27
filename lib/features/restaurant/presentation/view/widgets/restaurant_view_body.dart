import 'package:flutter/material.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';

class RestaurantViewBody extends StatelessWidget {
  const RestaurantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBackButton(),
      ],
    );
  }
}
