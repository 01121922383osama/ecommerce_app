import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/utils/app_localizations.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BuildLoginWithGoogle extends StatelessWidget {
  final VoidCallback? onPressed;
  const BuildLoginWithGoogle({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: context.tr.google,
          ),
          const SizedBox(width: 5),
          const Image(
            image: AssetImage(Assets.google),
          ),
        ],
      ),
    );
  }
}
