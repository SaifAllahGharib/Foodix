import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/add_food/presentation/view/add_food_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_grid_view_builder.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:yummy_home/features/restaurant/data/models/Foods.dart';
import 'package:yummy_home/features/restaurant/data/models/ProductModel.dart';

class MainSellerView extends StatefulWidget {
  const MainSellerView({super.key});

  @override
  State<MainSellerView> createState() => _MainSellerViewState();
}

class _MainSellerViewState extends State<MainSellerView> {
  late final TextEditingController _searchCategoryController;
  late final TextEditingController _searchFoodController;
  late final TextEditingController _categoryController;
  final List<ProductModel> listOfFoodCategories = [
    ProductModel(
      category: "Pizza",
      foods: [
        Foods(
          name: "Margherita",
          desc:
              "Classic pizza with tomato sauce, mozzarella cheese, and basil.",
          price: 120,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Pepperoni",
          desc: "Pepperoni pizza with cheese and delicious tomato sauce.",
          price: 150,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "BBQ Chicken",
          desc: "Grilled chicken pizza with BBQ sauce and cheese.",
          price: 180,
          image: "assets/images/person.jpg",
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
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Double Beef Burger",
          desc:
              "Double beef burger with cheese, lettuce, and caramelized onions.",
          price: 140,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Chicken Burger",
          desc: "Crispy chicken burger with spicy sauce and lettuce.",
          price: 110,
          image: "assets/images/person.jpg",
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
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Fettuccine Alfredo",
          desc: "Fettuccine with creamy sauce and grilled chicken.",
          price: 160,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Penne Arrabbiata",
          desc: "Penne pasta with spicy tomato sauce and basil.",
          price: 125,
          image: "assets/images/person.jpg",
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
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Strawberry Smoothie",
          desc: "Creamy and delicious strawberry smoothie.",
          price: 70,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Cold Coffee",
          desc: "Iced coffee with vanilla flavor.",
          price: 90,
          image: "assets/images/person.jpg",
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
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Cheesecake",
          desc: "Creamy cheesecake with vanilla and berry flavor.",
          price: 130,
          image: "assets/images/person.jpg",
        ),
        Foods(
          name: "Baklava",
          desc: "Baklava filled with nuts and soaked in honey.",
          price: 80,
          image: "assets/images/person.jpg",
        ),
      ],
    ),
  ];

  @override
  void initState() {
    _searchCategoryController = TextEditingController();
    _searchFoodController = TextEditingController();
    _categoryController = TextEditingController();

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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(
                isSeller: true,
                controller: _searchCategoryController,
                onChange: (value) {},
              ),
              SizedBox(height: Dimensions.height20(context)),
              Text(
                "categories".tr(context),
                style: Styles.textStyle30(context),
              ),
              SizedBox(height: Dimensions.height20(context)),
              Expanded(
                child: ListView.builder(
                  itemCount: listOfFoodCategories.length,
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
                              padding:
                                  EdgeInsets.all(Dimensions.height20(context)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomBackButton(),
                                  SizedBox(
                                      height: Dimensions.height20(context)),
                                  CustomSearchTextField(
                                    controller: _searchFoodController,
                                    isSeller: true,
                                    onChange: (value) {},
                                  ),
                                  SizedBox(
                                      height: Dimensions.height20(context)),
                                  Text(
                                    "Pizza",
                                    style: Styles.textStyle20(context),
                                  ),
                                  SizedBox(
                                      height: Dimensions.height20(context)),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        CustomGridViewBuilder(
                                          name: "Food",
                                          cost: "280",
                                          imageUrl: "assets/images/person.jpg",
                                        ),
                                        CustomFloatButton(
                                          onClick: () => GoRouter.of(context)
                                              .push(AddFoodView.id),
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
                            "${listOfFoodCategories[index].category}",
                            style: Styles.textStyle18(context),
                          ),
                          if (index != listOfFoodCategories.length - 1)
                            SizedBox(height: Dimensions.height20(context)),
                          if (index != listOfFoodCategories.length - 1)
                            Divider(
                              height: 1,
                              color: AppColors.gray,
                            ),
                          if (index != listOfFoodCategories.length - 1)
                            SizedBox(height: Dimensions.height20(context)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          CustomFloatButton(
            onClick: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20(context)),
                        topRight: Radius.circular(Dimensions.radius20(context)),
                      ),
                    ),
                    padding: EdgeInsets.all(Dimensions.height20(context)),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _categoryController,
                          hint: "category".tr(context),
                          onChanged: (val) {},
                        ),
                        SizedBox(height: Dimensions.height20(context)),
                        CustomButton(
                          text: "add".tr(context),
                          onClick: () {},
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
