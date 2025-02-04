import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_order_list_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/dates_orders_list_view.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/orders/orders_state.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int _selectedIndex = 0;
  final List<String> listOfDates = [
    "20 December",
    "19 December",
    "18 December",
    "17 December",
    "16 December",
    "15 December",
  ];

  void _handelState(state) {
    if (state is OrdersUpdateSelectedDayState) {
      _selectedIndex = state.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height20(context) * 2,
            right: Dimensions.height20(context),
            left: Dimensions.height20(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height10(context)),
              Text(
                'Your Orders',
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height20(context)),
              DatesOrdersListView(
                list: listOfDates,
                selectedIndex: _selectedIndex,
              ),
              SizedBox(height: Dimensions.height30(context)),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return CustomItemOrderListView();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
