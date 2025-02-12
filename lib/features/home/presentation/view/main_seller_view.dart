import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/category_seller_list_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_widget_float_button_add_category.dart';
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
    _searchCategoryController = TextEditingController();
    _searchFoodController = TextEditingController();
    _categoryController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _searchCategoryController.dispose();
    _searchFoodController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _addCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomWidgetFloatButtonAddCategory(
          categoryController: _categoryController,
        );
      },
    );
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
              CategorySellerListView(
                list: listOfFoodCategories,
                searchFoodController: _searchFoodController,
              ),
            ],
          ),
          CustomFloatButton(onClick: () => _addCategoryBottomSheet(context)),
        ],
      ),
    );
  }
}
