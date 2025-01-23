import 'package:flutter/material.dart';
import 'package:yummy_home/features/your_addresses/view/widgets/your_addresses_view_body.dart';

class YourAddressesView extends StatelessWidget {
  static const id = "/your_addresses_view";

  const YourAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YourAddressesViewBody(),
    );
  }
}
