import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(20),
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          4,
          (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: _buildIconWithLine(
                index: index,
                isSelected: index == selectedIndex,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIconWithLine({required int index, required bool isSelected}) {
    final List<IconData> iconData = [
      Icons.home,
      Icons.restaurant_outlined,
      Icons.shopping_cart_outlined,
      Icons.person,
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 4,
          width: isSelected ? 25 : 0,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: 8),
        Icon(
          iconData[index],
          color: isSelected ? AppColors.primaryColor : AppColors.gray,
          size: 28,
        ),
      ],
    );
  }
}
