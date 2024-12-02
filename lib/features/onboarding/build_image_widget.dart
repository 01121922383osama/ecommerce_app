import 'package:ecommerce_app/core/extension/screen_utils.dart';
import 'package:flutter/material.dart';

class BuildImageWidget extends StatelessWidget {
  final String image;
  const BuildImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: context.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(100),
          ),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
