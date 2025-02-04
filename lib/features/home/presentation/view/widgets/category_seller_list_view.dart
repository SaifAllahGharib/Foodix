import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/features/add_food/presentation/view/add_food_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_grid_view_builder.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';

class CategorySellerListView extends StatelessWidget {
  final List<ProductModel> list;
  final TextEditingController searchFoodController;

  const CategorySellerListView({
    super.key,
    required this.list,
    required this.searchFoodController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.all(Dimensions.height20(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBackButton(),
                        SizedBox(height: Dimensions.height20(context)),
                        CustomSearchTextField(
                          controller: searchFoodController,
                          isSeller: true,
                          onChange: (value) {},
                        ),
                        SizedBox(height: Dimensions.height20(context)),
                        Text(
                          "Pizza",
                          style: Styles.textStyle20(context),
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
                                onClick: () =>
                                    GoRouter.of(context).push(AddFoodView.id),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            contentPadding: EdgeInsets.zero,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${list[index].category}",
                  style: Styles.textStyle18(context),
                ),
                if (index != list.length - 1)
                  SizedBox(height: Dimensions.height20(context)),
                if (index != list.length - 1)
                  Divider(
                    height: 1,
                    color: AppColors.gray,
                  ),
                if (index != list.length - 1)
                  SizedBox(height: Dimensions.height20(context)),
              ],
            ),
          );
        },
      ),
    );
  }
}
