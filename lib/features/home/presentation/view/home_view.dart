import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/home/home_state.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  static const String id = "/home_view";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeChangeViewState) {
            _selectedIndex = state.selectedIndex;
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: HomeViewBody(selectedIndex: _selectedIndex),
            bottomNavigationBar: CustomBottomNavigationBar(
              onIndexChanged: (index) {
                context.read<HomeCubit>().changeTab(index);
              },
            ),
          );
        },
      ),
    );
  }
}
