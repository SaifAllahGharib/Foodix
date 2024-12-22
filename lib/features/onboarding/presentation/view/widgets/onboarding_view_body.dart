import 'package:flutter/material.dart';
import 'package:yummy_home/constants.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(pageViewImages[index]);
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_outlined),
          ),
        ],
      ),
    );
  }
}
