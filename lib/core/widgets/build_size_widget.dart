import 'package:flutter/material.dart';

class BuildSizeWidget extends StatelessWidget {
  final double? hight;
  const BuildSizeWidget({super.key, this.hight = 25});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(height: 25),
    );
  }
}
