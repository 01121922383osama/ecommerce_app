import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/extension/navigations.dart';
import 'package:ecommerce_app/core/widgets/custom_text.dart';
import 'package:ecommerce_app/features/onboarding/body_onboarding_page.dart';
import 'package:ecommerce_app/features/onboarding/manager/toggel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    return Scaffold(
      body: BlocBuilder<ToggelCubit, int>(
        builder: (context, state) {
          return Stack(
            children: [
              PageView.builder(
                itemCount: 3,
                onPageChanged: (value) {
                  context.read<ToggelCubit>().chagenIndex(value);
                },
                controller: controller,
                itemBuilder: (context, index) {
                  return BodyOnboardingPage(
                    controller: controller,
                  );
                },
              ),
              Positioned(
                bottom: 35,
                left: 35,
                child: AnimatedSmoothIndicator(
                  activeIndex: state,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                right: 25,
                child: state == 2
                    ? OutlinedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Colors.black,
                          ),
                        ),
                        onPressed: () {
                          context.pushNamedAndRemoveUntil(
                            pageRoute: AppRoutes.signIn,
                          );
                        },
                        child: const CustomText(
                          text: AppStrings.getStarted,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: IconButton(
                          onPressed: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: const Icon(
                            Icons.forward,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
