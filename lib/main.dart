import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/config/routes/route.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/locator/injection.dart' as locator;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await locator.init();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.locator<HomeCubit>()..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..getCartItems(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: RoutesGenerator.onGenerateRoute,
        onUnknownRoute: RoutesGenerator.onUnknownRoute,
      ),
    );
  }
}
