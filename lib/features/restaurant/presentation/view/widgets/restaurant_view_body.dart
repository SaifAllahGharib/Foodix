import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_category_list_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_food_category_list_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/top_section_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_cubit.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_state.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({super.key});

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody> {
  late final ScrollController _scrollController;
  double _opacity = 0.0;
  int _selectedIndex = 0;
  double _appBarHeight = 0.0;
  final List<Map<String, dynamic>> listOfFoodCategories = [
    {
      "category": "Chicken",
      "foods": [
        {
          "name": "Ch",
          "desc": "Delicious grilled chicken",
          "price": "170",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch2",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch3",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch4",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch5",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch6",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch7",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
      ]
    },
    {
      "category": "Beef",
      "foods": [
        {
          "name": "Beef1",
          "desc": "Juicy steak",
          "price": "200",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef2",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef3",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef4",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef5",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
      ]
    },
    {
      "category": "Drinks",
      "foods": [
        {
          "name": "Coca Cola",
          "desc": "Refreshing cola",
          "price": "50",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Orange Juice",
          "desc": "Freshly squeezed",
          "price": "60",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Orange Juice",
          "desc": "Freshly squeezed",
          "price": "60",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Orange Juice",
          "desc": "Freshly squeezed",
          "price": "60",
          "image": "assets/images/person.jpg"
        },
      ]
    },
    {
      "category": "Chicken2",
      "foods": [
        {
          "name": "Ch",
          "desc": "Delicious grilled chicken",
          "price": "170",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch2",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch3",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch4",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch5",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch6",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Ch7",
          "desc": "Spicy fried chicken",
          "price": "140",
          "image": "assets/images/person.jpg"
        },
      ]
    },
    {
      "category": "Beef2",
      "foods": [
        {
          "name": "Beef1",
          "desc": "Juicy steak",
          "price": "200",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef2",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef3",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef4",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Beef5",
          "desc": "Tasty beef burger",
          "price": "180",
          "image": "assets/images/person.jpg"
        },
      ]
    },
    {
      "category": "Drinks2",
      "foods": [
        {
          "name": "Coca Cola",
          "desc": "Refreshing cola",
          "price": "50",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Orange Juice",
          "desc": "Freshly squeezed",
          "price": "60",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Orange Juice",
          "desc": "Freshly squeezed",
          "price": "60",
          "image": "assets/images/person.jpg"
        },
        {
          "name": "Orange Juice",
          "desc": "Freshly squeezed",
          "price": "60",
          "image": "assets/images/person.jpg"
        },
      ]
    }
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      context
          .read<RestaurantCubit>()
          .showCategoryListView(_scrollController.offset);
      context
          .read<RestaurantCubit>()
          .updateOpacity((_scrollController.offset / 200).clamp(0, 1));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onClickCategory(BuildContext context, int categoryIndex) {
    context.read<RestaurantCubit>().onClickCategory(categoryIndex);

    _scrollController.animateTo(
      categoryIndex.toDouble(),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleStates(state) {
    if (state is RestaurantShowCategoryListViewState) {
      _appBarHeight = state.appBarHeight;
    }

    if (state is RestaurantUpdateOpacityState) {
      _opacity = state.opacity;
    }

    if (state is RestaurantOnClickCategoryState) {
      _selectedIndex = state.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantState>(
      listener: (context, state) => _handleStates(state),
      builder: (context, state) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(child: TopSectionRestaurantView()),
                  SliverToBoxAdapter(
                    child: CustomCategoryListView(
                      selectedIndex: _selectedIndex,
                      list: listOfFoodCategories,
                      onClickInItem: (index) =>
                          _onClickCategory(context, index),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: listOfFoodCategories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height15(context),
                              horizontal: Dimensions.height20(context),
                            ),
                            child: Text(
                              listOfFoodCategories[index]["category"],
                              style: Styles.textStyle18(context),
                            ),
                          ),
                          CustomFoodCategoryListView(
                            listOfFoodCategories: listOfFoodCategories[index]
                                ["foods"],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              CustomAppBarRestaurantView(
                opacity: _opacity,
                selectedIndex: _selectedIndex,
                list: listOfFoodCategories,
                appBarHeight: _appBarHeight,
                onClickInItem: (index) => _onClickCategory(context, index),
              ),
            ],
          ),
        );
      },
    );
  }
}
