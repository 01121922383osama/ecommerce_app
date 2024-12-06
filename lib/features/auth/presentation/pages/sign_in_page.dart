import 'package:ecommerce_app/core/extension/navigations.dart';
import 'package:ecommerce_app/core/locator/injection.dart';
import 'package:ecommerce_app/core/utils/app_localizations.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_text.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/core/widgets/show_toast_widget.dart';
import 'package:ecommerce_app/features/app/presentation/pages/app_page.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/build_content_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/build_login_with_google.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/build_ritch_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.pushAndRemoveUntil(widget: const AppPage());
                context.read<AuthCubit>().signInEmail.clear();
                context.read<AuthCubit>().signInPassword.clear();
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
              return AutofillGroup(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const BuildContentWidget(),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      hinttext: context.tr.email,
                      autofillHints: const [AutofillHints.email],
                      controller: context.read<AuthCubit>().signInEmail,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    const SizedBox(height: 15),
                    CustomTextfield(
                      hinttext: context.tr.password,
                      autofillHints: const [AutofillHints.password],
                      controller: context.read<AuthCubit>().signInPassword,
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      child: state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : CustomText(
                              text: context.tr.signIn,
                            ),
                      onPressed: () {
                        final email =
                            context.read<AuthCubit>().signInEmail.text.trim();
                        final password = context
                            .read<AuthCubit>()
                            .signInPassword
                            .text
                            .trim();
                        if (email.isNotEmpty || password.isNotEmpty) {
                          context.read<AuthCubit>().sigIn(
                                email: email,
                                password: password,
                              );
                        } else {
                          customShowTost(
                            context: context,
                            message: context.tr.enterEmailPassword,
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
                    const BuildRitchTextWidget(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
