import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

final List<String> _text = [
  'All',
  'Shoes',
  'Clothes',
  'Bags',
];

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
                  border: Border.all(
                    color: AppColors.black.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  _text[index],
                  style: const TextStyle(
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
