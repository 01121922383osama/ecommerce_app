import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BuildIconsWidget extends StatelessWidget {
  final bool isSelected;
  const BuildIconsWidget({super.key, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            4,
            (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: isSelected ? AppColors.black : Colors.grey.shade200,
                  border: Border.all(
                    color: AppColors.black.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  _text[index],
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

final List<String> _text = [
  'All',
  'Shoes',
  'Clothes',
  'Bags',
];
