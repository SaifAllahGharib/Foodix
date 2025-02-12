import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/restaurant/data/models/Foods.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_category_tab_bar.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_restaurant_product_list.dart';
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
  late final List<GlobalKey> keys;
  double _opacity = 0.0;
  double _appBarHeight = 0.0;
  final List<ProductModel> listOfFoodCategories = [
    ProductModel(
      category: "Pizza",
      foods: [
        Foods(
          name: "Margherita",
          desc:
              "Classic pizza with tomato sauce, mozzarella cheese, and basil.",
          price: 120,
          image: " ",
        ),
        Foods(
          name: "Pepperoni",
          desc: "Pepperoni pizza with cheese and delicious tomato sauce.",
          price: 150,
          image: " ",
        ),
        Foods(
          name: "BBQ Chicken",
          desc: "Grilled chicken pizza with BBQ sauce and cheese.",
          price: 180,
          image: " ",
        ),
      ],
    ),
    ProductModel(
      category: "Burger",
      foods: [
        Foods(
          name: "Cheeseburger",
          desc:
              "Fresh beef burger with cheese, lettuce, tomato, and special sauce.",
          price: 90,
          image: " ",
        ),
        Foods(
          name: "Double Beef Burger",
          desc:
              "Double beef burger with cheese, lettuce, and caramelized onions.",
          price: 140,
          image: " ",
        ),
        Foods(
          name: "Chicken Burger",
          desc: "Crispy chicken burger with spicy sauce and lettuce.",
          price: 110,
          image: " ",
        ),
      ],
    ),
    ProductModel(
      category: "Pasta",
      foods: [
        Foods(
          name: "Spaghetti Bolognese",
          desc: "Spaghetti with tomato sauce and minced meat.",
          price: 130,
          image: " ",
        ),
        Foods(
          name: "Fettuccine Alfredo",
          desc: "Fettuccine with creamy sauce and grilled chicken.",
          price: 160,
          image: " ",
        ),
        Foods(
          name: "Penne Arrabbiata",
          desc: "Penne pasta with spicy tomato sauce and basil.",
          price: 125,
          image: " ",
        ),
      ],
    ),
    ProductModel(
      category: "Drinks",
      foods: [
        Foods(
          name: "Orange Juice",
          desc: "Fresh orange juice.",
          price: 50,
          image: " ",
        ),
        Foods(
          name: "Strawberry Smoothie",
          desc: "Creamy and delicious strawberry smoothie.",
          price: 70,
          image: " ",
        ),
        Foods(
          name: "Cold Coffee",
          desc: "Iced coffee with vanilla flavor.",
          price: 90,
          image: " ",
        ),
      ],
    ),
    ProductModel(
      category: "Desserts",
      foods: [
        Foods(
          name: "Chocolate Cake",
          desc: "Rich chocolate cake with chocolate sauce.",
          price: 100,
          image: " ",
        ),
        Foods(
          name: "Cheesecake",
          desc: "Creamy cheesecake with vanilla and berry flavor.",
          price: 130,
          image: " ",
        ),
        Foods(
          name: "Baklava",
          desc: "Baklava filled with nuts and soaked in honey.",
          price: 80,
          image: " ",
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    initControllers();
    _generateGlobalKeys();
    _scrollControllerListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void initControllers() {
    _scrollController = ScrollController();
    _tabController = TabController(
      length: listOfFoodCategories.length,
      vsync: this,
    );
  }

  void _scrollControllerListener() {
    _scrollController.addListener(() {
      animateToTab();
      _showCategoryTabBar();
      _updateOpacity();
    });
  }

  void _showCategoryTabBar() {
    context
        .read<RestaurantCubit>()
        .showCategoryTabBar(_scrollController.offset);
  }

  void _updateOpacity() {
    context
        .read<RestaurantCubit>()
        .updateOpacity((_scrollController.offset / 200).clamp(0, 1));
  }

  void _generateGlobalKeys() {
    keys = List.generate(listOfFoodCategories.length, (index) => GlobalKey());
  }

  void _onClickCategory(int index) {
    _scrollController.removeListener(() => animateToTab());

    _scrollToCategory(index);
  }

  void _scrollToCategory(int index) {
    final context = keys[index].currentContext;

    Scrollable.ensureVisible(
      context!,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: Dimensions.height10(context) * 0.04,
    );
  }

  void animateToTab() {
    late RenderBox box;
    for (int i = 0; i < keys.length; i++) {
      box = keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (_scrollController.offset >= position.dy) {
        _tabController.animateTo(
          i,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }
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
                  const SliverToBoxAdapter(child: TopSectionRestaurantView()),
                  SliverToBoxAdapter(
                    child: CustomCategoryTabBar(
                      tabController: _tabController,
                      list: listOfFoodCategories,
                      onClickCategory: (index) => _onClickCategory(index),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomRestaurantProductList(
                      keys: keys,
                      listOfFoodCategories: listOfFoodCategories,
                    ),
                  ),
                ],
              ),
              CustomAppBarRestaurantView(
                tabController: _tabController,
                opacity: _opacity,
                list: listOfFoodCategories,
                appBarHeight: _appBarHeight,
                onClickCategory: (index) => _onClickCategory(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
