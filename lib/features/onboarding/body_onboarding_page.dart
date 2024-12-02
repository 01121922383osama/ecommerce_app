import 'package:ecommerce_app/core/widgets/custom_text.dart';
import 'package:ecommerce_app/features/onboarding/build_image_widget.dart';
import 'package:flutter/material.dart';

class BodyOnboardingPage extends StatelessWidget {
  final PageController controller;
  const BodyOnboardingPage({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: const [
        BuildImageWidget(image: "assets/images/images1.jpg"),
        SizedBox(height: 20),
        CustomText(
          text: 'Take Advantage Of The Offers Shopping',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 20),
        CustomText(
          text:
              'publish is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
