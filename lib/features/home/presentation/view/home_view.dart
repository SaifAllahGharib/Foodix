import 'package:flutter/material.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String id = "/home_view";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
