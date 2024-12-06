import 'package:flutter/material.dart';

class BuildBottomNavBarWidget extends StatelessWidget {
  final int index;
  final void Function(int)? onDestinationSelected;
  const BuildBottomNavBarWidget({
    super.key,
    required this.index,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      selectedIndex: index,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Shop',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('+99'),
            child: Icon(Icons.notifications),
          ),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
