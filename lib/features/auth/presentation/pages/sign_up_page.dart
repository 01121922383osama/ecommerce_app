import 'package:ecommerce_app/core/extension/navigations.dart';
import 'package:ecommerce_app/core/locator/injection.dart';
import 'package:ecommerce_app/core/utils/app_localizations.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_text.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/core/widgets/show_toast_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/build_content_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/build_login_with_google.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/build_ritch_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.pop();
                context.read<AuthCubit>().signUpEmail.clear();
                context.read<AuthCubit>().signUpPassword.clear();
              }
              if (state is AuthFailure) {
                customShowTost(
                  context: context,
                  message: state.message,
                  color: Colors.red,
                );
              }
            },
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  BuildContentWidget(
                    text1: '${context.tr.signUp}!',
                    text2: context.tr.createAccount,
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    hinttext: context.tr.email,
                    controller: context.read<AuthCubit>().signUpEmail,
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    hinttext: context.tr.password,
                    controller: context.read<AuthCubit>().signUpPassword,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    child: state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : CustomText(
                            text: context.tr.signUp,
                          ),
                    onPressed: () {
                      final email =
                          context.read<AuthCubit>().signUpEmail.text.trim();
                      final password =
                          context.read<AuthCubit>().signUpPassword.text.trim();
                      if (email.isNotEmpty || password.isNotEmpty) {
                        context.read<AuthCubit>().sigUp(
                              email: email,
                              password: password,
                            );
                      } else {
                        customShowTost(
                          context: context,
                          message: context.tr.enterEmailPassword,
                          color: Colors.red,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: CustomText(
                      text: context.tr.or,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  BuildLoginWithGoogle(
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomText(
                      text: context.tr.or,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  BuildRitchTextWidget(
                    text1: context.tr.alreadyHaveAccount,
                    text2: context.tr.signIn,
                    onTap: () {
                      context.pop();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
