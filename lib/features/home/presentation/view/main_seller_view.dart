import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/add_food/presentation/view/add_food_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_grid_view_builder.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';

class MainSellerView extends StatefulWidget {
  const MainSellerView({super.key});

  @override
  State<MainSellerView> createState() => _MainSellerViewState();
}

class _MainSellerViewState extends State<MainSellerView> {
  late final TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height20(context) * 2,
        right: Dimensions.height20(context),
        left: Dimensions.height20(context),
      ),
      child: Column(
        children: [
          CustomSearchTextField(
            controller: _search,
            onChange: (value) {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          Expanded(
            child: Stack(
              children: [
                CustomGridViewBuilder(
                  name: "Food",
                  cost: "280",
                  imageUrl: "assets/images/person.jpg",
                ),
                CustomFloatButton(
                  onClick: () => GoRouter.of(context).push(AddFoodView.id),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
