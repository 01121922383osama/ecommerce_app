import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BuildContentWidget extends StatelessWidget {
  final String? text1;
  final String? text2;
  const BuildContentWidget({
    super.key,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey.withOpacity(0.3),
            child: const CustomText(
              text: 'Logo',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomText(
          text: text1 ?? AppStrings.welcome,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        CustomText(
          text: text2 ?? AppStrings.plzLogin,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
