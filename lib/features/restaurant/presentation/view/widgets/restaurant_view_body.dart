import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_app_bar_restaurant_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/custom_category_list_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/top_section_restaurant_view.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({super.key});

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;
  int _selectedIndex = 0;
  double _appBarHeight = 0.0;
  final List list = [
    "Choose any you",
    "Choose",
    "Orod gamda",
    "Chiken",
    "Beef",
    "Abatizers",
    "Drinkes",
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _opacity = (_scrollController.offset / 200).clamp(0, 1);
        _appBarHeight = _scrollController.offset;
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
              SliverToBoxAdapter(child: TopSectionRestaurantView()),
              SliverToBoxAdapter(
                child: CustomCategoryListView(
                  selectedIndex: _selectedIndex,
                  list: list,
                  onClickInItem: (index) {
                    setState(() => _selectedIndex = index);
                  },
                ),
              ),
              SliverList.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: context.read<LocalCubit>().isDirectionRight
                          ? Dimensions.height15(context)
                          : 0,
                      left: context.read<LocalCubit>().isDirectionRight
                          ? 0
                          : Dimensions.height15(context),
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: Dimensions.height130(context),
                          padding: EdgeInsets.only(
                              bottom: Dimensions.height10(context)),
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.height130(context) * 0.9,
                                height: Dimensions.height130(context) * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20(context)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/person.jpg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: AppColors.gray,
                        ),
                        SizedBox(height: Dimensions.height20(context)),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          CustomAppBarRestaurantView(
            opacity: _opacity,
            selectedIndex: _selectedIndex,
            list: list,
            appBarHeight: _appBarHeight,
            onClickInItem: (index) {
              setState(() => _selectedIndex = index);
            },
          ),
        ],
      ),
    );
  }
}
