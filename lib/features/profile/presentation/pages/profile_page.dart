import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/core/extension/navigations.dart';
import 'package:ecommerce_app/core/locator/injection.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/profile/manager/language/language_cubit.dart';
import 'package:ecommerce_app/features/profile/manager/themes/theme_cubite.dart';
import 'package:ecommerce_app/features/profile/presentation/widget/buildtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeCubite>().isDark(context);
    log(isDark.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Image and Name
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/200',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 50,
                      backgroundImage: imageProvider,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Fscreation',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Fscreation441@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Menu Items
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    BuildTile(
                      icon: Icons.person_outline,
                      title: 'Moffa',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    BuildTile(
                      icon: Icons.shopping_bag_outlined,
                      title: 'My Order',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    BuildTile(
                      icon: Icons.favorite_border,
                      title: 'My Favourites',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    BlocBuilder<LanguageCubit, String>(
                      builder: (context, currentLang) {
                        return BuildTile(
                          icon: Icons.language,
                          title: 'arabic',
                          onTap: () {},
                          trailing: DropdownButton<String>(
                            value: currentLang,
                            items: const [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'ar',
                                child: Text('العربية'),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                context
                                    .read<LanguageCubit>()
                                    .changeLanguage(newValue);
                              }
                            },
                          ),
                        );
                      },
                    ),
                    _buildDivider(),
                    BuildTile(
                      icon: Icons.light_mode,
                      title: 'Light',
                      onTap: () {},
                      trailing: PopupMenuButton<ThemeRefrence>(
                        onSelected: (value) {
                          context.read<ThemeCubite>().chageTheme(value);
                        },
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: ThemeRefrence.system,
                              child: Text('System'),
                            ),
                            const PopupMenuItem(
                              value: ThemeRefrence.light,
                              child: Text('Light'),
                            ),
                            const PopupMenuItem(
                              value: ThemeRefrence.dark,
                              child: Text('Dark'),
                            ),
                          ];
                        },
                      ),
                    ),
                    _buildDivider(),
                    BlocProvider(
                      create: (context) => locator<AuthCubit>(),
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return BuildTile(
                            icon: Icons.logout,
                            title: 'Logout',
                            onTap: () {
                              context.read<AuthCubit>().sigOut().then(
                                (value) {
                                  if (context.mounted) {
                                    context.pushNamedAndRemoveUntil(
                                        pageRoute: AppRoutes.signIn);
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}
