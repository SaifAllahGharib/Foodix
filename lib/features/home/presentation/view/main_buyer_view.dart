import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_app_bar_main_buyer_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_sliver_list_view_main_buyer_view.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_buyer/main_buyer_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_buyer/main_buyer_state.dart';

class MainBuyerView extends StatefulWidget {
  const MainBuyerView({super.key});

  @override
  State<MainBuyerView> createState() => _MainBuyerViewState();
}

class _MainBuyerViewState extends State<MainBuyerView> {
  @override
  void initState() {
    fetchRestaurants(context);
    super.initState();
  }

  void fetchRestaurants(BuildContext context) {
    context.read<MainBuyerCubit>().fetchMainBuyerRestaurants();
  }

  void _handleState(state) {
    if (state is MainBuyerSuccessState) {
      final snapshot = state.snapshot;

      if (snapshot.exists) {
        Map categories = snapshot.value as Map;
        categories.forEach(
          (key, value) {
            print("KEY: $key");
            print("VALUE: $value");
          },
        );
      }
    } else if (state is MainBuyerFailureState) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBuyerCubit, MainBuyerState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is MainBuyerLoadingState) return const Loading();

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomAppBarMainBuyerView()),
            SliverPadding(
              padding: EdgeInsets.all(Dimensions.height20),
              sliver: const CustomSliverListViewMainBuyerView(),
            ),
          ],
        );
      },
    );
  }
}
