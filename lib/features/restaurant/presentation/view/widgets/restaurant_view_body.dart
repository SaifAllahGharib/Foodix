import 'package:flutter/material.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/top_section_restaurant_view.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({super.key});

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _opacity = (_scrollController.offset / 200).clamp(0, 1);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: TopSectionRestaurantView(),
              ),
              SliverList.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Text("$index");
                },
              )
            ],
          ),
          CustomAppBarRestaurantView(opacity: _opacity),
        ],
      ),
    );
  }
}
