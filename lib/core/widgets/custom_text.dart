import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final List<Shadow>? shadows;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 22,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.shadows = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows,
      ),
    );
  }
}
