import 'package:flutter/material.dart';
import 'package:yummy_home/features/choose_food/presentation/view/widgets/choose_food_view_body.dart';

class ChooseFoodView extends StatelessWidget {
  static const String id = "/choose_food_view";

  const ChooseFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChooseFoodViewBody());
  }
}
