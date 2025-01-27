import 'package:flutter/material.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/restaurant_view_body.dart';

class RestaurantView extends StatelessWidget {
  static const String id = "/restaurant_view";

  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RestaurantViewBody());
  }
}
