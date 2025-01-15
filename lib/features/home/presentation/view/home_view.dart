import 'package:flutter/material.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  static const String id = "/home_view";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(selectedIndex: selectedIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        onIndexChanged: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
