import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/restaurant/data/models/Foods.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_category_tab_bar.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_food_category_list_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/top_section_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_cubit.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_state.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({super.key});

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController _tabController;
  double _opacity = 0.0;
  double _appBarHeight = 0.0;
  final List<ProductModel> listOfFoodCategories = [
    ProductModel(
      category: "Chicken",
      foods: [
        Foods(
          name: "Chicken 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 170,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Chicken 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 190,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Chicken 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 210,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Beef",
      foods: [
        Foods(
          name: "Beef 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 200,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 250,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 300,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 4",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 340,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 5",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 600,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Chicken 2",
      foods: [
        Foods(
          name: "Beef 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 200,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 250,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 300,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 4",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 340,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 5",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 600,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Beef2",
      foods: [
        Foods(
          name: "Beef 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 200,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 250,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 300,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 4",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 340,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 5",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 600,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Chicken",
      foods: [
        Foods(
          name: "Chicken 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 170,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Chicken 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 190,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Chicken 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 210,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Beef",
      foods: [
        Foods(
          name: "Beef 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 200,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 250,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 300,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 4",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 340,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 5",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 600,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Chicken 2",
      foods: [
        Foods(
          name: "Beef 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 200,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 250,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 300,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 4",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 340,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 5",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 600,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
    ProductModel(
      category: "Beef2",
      foods: [
        Foods(
          name: "Beef 1",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 200,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 2",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 250,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 3",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 300,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 4",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 340,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Beef 5",
          desc:
              "josy, mashweya, jamda, mot, salte,josy, mashweya, jamda, mot, salte",
          price: 600,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      length: listOfFoodCategories.length,
      vsync: this,
    );

    _scrollController.addListener(() {
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

  void _handleStates(state) {
    if (state is RestaurantShowCategoryListViewState) {
      _appBarHeight = state.appBarHeight;
    }

    if (state is RestaurantUpdateOpacityState) {
      _opacity = state.opacity;
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
                    child: CustomCategoryTabBar(
                      tabController: _tabController,
                      list: listOfFoodCategories,
                      onClickCategory: (index) {},
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: listOfFoodCategories.length,
                      (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimensions.height15(context),
                                horizontal: Dimensions.height20(context),
                              ),
                              child: Text(
                                listOfFoodCategories[index].category!,
                                style: Styles.textStyle18(context),
                              ),
                            ),
                            CustomFoodCategoryListView(
                              listOfFoodCategories:
                                  listOfFoodCategories[index].foods ?? [],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              CustomAppBarRestaurantView(
                tabController: _tabController,
                opacity: _opacity,
                list: listOfFoodCategories,
                appBarHeight: _appBarHeight,
                onClickCategory: (index) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
