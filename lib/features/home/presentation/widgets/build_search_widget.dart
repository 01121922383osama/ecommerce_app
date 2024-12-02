import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class BuildSearchWidget extends StatelessWidget {
  const BuildSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomTextfield(
                prefixIcon: Icon(Icons.search),
                hinttext: 'Search',
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: AppColors.black,
              child: Icon(Icons.menu, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
