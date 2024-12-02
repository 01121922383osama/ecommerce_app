import 'package:ecommerce_app/core/widgets/build_size_widget.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_state.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/build_grid_container_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/build_icons_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/build_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/build_app_bar_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const BuildAppBarHome(),
                const BuildSizeWidget(),
                const BuildSearchWidget(),
                const BuildSizeWidget(),
                const BuildIconsWidget(isSelected: true),
                const BuildSizeWidget(),
                state.maybeWhen(
                  loading: () => const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  failure: (error) => SliverToBoxAdapter(
                    child: Center(
                      child: Text(error),
                    ),
                  ),
                  success: (data) => BuildGridContainerWidget(products: data),
                  orElse: () => const SliverToBoxAdapter(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
