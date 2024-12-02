import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void customShowTost(
    {required BuildContext context,
    required String message,
    Color color = Colors.green}) {
  showToast(
    message,
    context: context,
    backgroundColor: color,
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    duration: const Duration(seconds: 3),
    animation: StyledToastAnimation.slideFromBottom,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.bottom,
  );
}
