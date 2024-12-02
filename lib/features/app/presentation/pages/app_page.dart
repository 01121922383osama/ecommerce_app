import 'package:ecommerce_app/features/app/presentation/manager/toggle/toggle_cubit.dart';
import 'package:ecommerce_app/features/app/presentation/widgets/build_bottom_nav_bar_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:ecommerce_app/features/home/presentation/pages/home_page.dart';
import 'package:ecommerce_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const Center(child: Text('Notifcation')),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleCubit(),
      child: BlocBuilder<ToggleCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              controller: _controller,
              onPageChanged: (value) {
                context.read<ToggleCubit>().toggle(value: value);
              },
              children: _pages,
            ),
            bottomNavigationBar: BuildBottomNavBarWidget(
              index: state,
              onDestinationSelected: (value) {
                context.read<ToggleCubit>().toggle(value: value);
                _controller.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
