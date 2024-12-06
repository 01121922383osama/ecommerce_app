import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/config/routes/route.dart';
import 'package:ecommerce_app/config/themes/theme_data.dart';
import 'package:ecommerce_app/core/locator/injection.dart' as locator;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/profile/manager/language/language_cubit.dart';
import 'package:ecommerce_app/features/profile/manager/themes/theme_cubite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        BlocProvider(
          create: (context) => ThemeCubite(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubite, ThemeMode>(
        builder: (context, theme) {
          return BlocBuilder<LanguageCubit, String>(
            builder: (context, lang) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Ecommerce App',
                theme: AppThemeData.light,
                darkTheme: AppThemeData.dark,
                themeMode: theme,
                locale: Locale(lang),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                builder: (context, child) {
                  return Directionality(
                    textDirection:
                        lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
                    child: child!,
                  );
                },
                initialRoute: AppRoutes.splash,
                onGenerateRoute: RoutesGenerator.onGenerateRoute,
                onUnknownRoute: RoutesGenerator.onUnknownRoute,
              );
            },
          );
        },
      ),
    );
  }
}
