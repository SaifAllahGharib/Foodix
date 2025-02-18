import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/assets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(Assets.empty),
      ),
    );
  }
}
