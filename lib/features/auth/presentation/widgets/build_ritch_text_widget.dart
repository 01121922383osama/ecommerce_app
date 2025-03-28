import 'package:ecommerce_app/core/extension/navigations.dart';
import 'package:ecommerce_app/core/utils/app_localizations.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BuildRitchTextWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text1;
  final String? text2;

  const BuildRitchTextWidget({
    super.key,
    this.onTap,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1 ?? context.tr.dontHaveAccount,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Colors.grey,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2 ?? context.tr.signUp,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTap ??
                  () {
                    context.push(widget: const SignUpPage());
                  },
          ),
        ],
      ),
    );
  }
}
