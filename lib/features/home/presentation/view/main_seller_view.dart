import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/add_food/presentation/view/add_food_view.dart';
import 'package:yummy_home/features/food_details/presentation/view/food_details_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/grid_item_view.dart';

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
          CustomTextField(
            controller: _search,
            hint: "search".tr(context),
            onChanged: (val) {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          Expanded(
            child: Stack(
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimensions.height10(context),
                    mainAxisSpacing: Dimensions.height10(context) * 0.6,
                  ),
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GridItemView(
                      foodName: "Food",
                      imageUrl: "assets/images/person.jpg",
                      onClick: () {
                        GoRouter.of(context).push(FoodDetailsView.id);
                      },
                    );
                  },
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
