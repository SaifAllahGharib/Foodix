import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/empty_widget.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/category_seller_list_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_float_button.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_widget_float_button_add_category.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_seller/main_seller_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';
import 'package:yummy_home/generated/l10n.dart';

class MainSellerView extends StatefulWidget {
  const MainSellerView({super.key});

  @override
  State<MainSellerView> createState() => _MainSellerViewState();
}

class _MainSellerViewState extends State<MainSellerView> {
  late final TextEditingController _searchCategoryController;
  late final TextEditingController _searchFoodController;
  late final TextEditingController _categoryController;
  final List<ProductModel> listOfFoodCategories = [];

  @override
  void initState() {
    _getCategories(context);
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

  void _getCategories(BuildContext context) {
    context.read<MainSellerCubit>().getCategories();
  }

  void _getCategoriesSuccess(state) {
    final snapshot = state.snapshot;
    listOfFoodCategories.clear();

    if (snapshot.exists) {
      Map categories = snapshot.value as Map;
      categories.forEach(
        (key, value) {
          listOfFoodCategories.add(ProductModel.fromJson(value));
        },
      );
    }
  }

  void _handleState(state) {
    if (state is MainSellerAddCategory) {
      snackBar(
        context: context,
        text: S.of(context).success,
        color: AppColors.primaryColor,
      );
    } else if (state is MainSellerAddFood) {
      snackBar(
        context: context,
        text: S.of(context).success,
        color: AppColors.primaryColor,
      );
    } else if (state is MainSellerGetCategory) {
      _getCategoriesSuccess(state);
    } else if (state is MainSellerFailure) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainSellerCubit, MainSellerState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is MainSellerLoading) return const Loading();

        return Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height20 * 2,
            right: Dimensions.height20,
            left: Dimensions.height20,
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
                  if (listOfFoodCategories.isEmpty)
                    const EmptyWidget()
                  else
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Dimensions.height20),
                          Text(
                            S.of(context).categories,
                            style: Styles.textStyle30(context),
                          ),
                          SizedBox(height: Dimensions.height20),
                          CategorySellerListView(
                            list: listOfFoodCategories,
                            searchFoodController: _searchFoodController,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              CustomFloatButton(
                  onClick: () => _addCategoryBottomSheet(context)),
            ],
          ),
        );
      },
    );
  }
}
