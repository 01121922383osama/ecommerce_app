import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Iterable<String>? autofillHints;
  const CustomTextfield({
    super.key,
    required this.hinttext,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofillHints: autofillHints,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
