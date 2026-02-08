// lib/app/modules/onboarding/views/onboarding_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/models/onboarding_model.dart';
import 'package:glass/widgets/glass_background.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/app/core/constants/colors.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassBackground(
        style: BackgroundStyle.dreamy,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.pages.length,
                  itemBuilder: (context, index) {
                    return _buildPage(controller.pages[index], index);
                  },
                ),
              ),
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingData data, int index) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeSlide(
            delay: 200,
            child: Text(
              data.image,
              style: const TextStyle(fontSize: 120),
            ),
          ),
          const SizedBox(height: 60),
          AnimatedFadeSlide(
            delay: 400,
            child: Text(
              data.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedFadeSlide(
            delay: 600,
            child: Text(
              data.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

Widget _buildBottomSection() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min, // <-- Important!
        children: [
          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.pages.length,
              (index) => _buildDot(index),
            ),
          ),
          const SizedBox(height: 32),

          // Next / Get Started button
          AnimatedFadeSlide(
            delay: 800,
            child: Obx(() => GlassButton(
                  text: controller.currentPage.value == controller.pages.length - 1
                      ? 'Get Started'
                      : 'Next',
                  onPressed: () {
                    if (controller.currentPage.value == controller.pages.length - 1) {
                      Get.offNamed('/login');
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  width: double.infinity,
                )),
          ),
          const SizedBox(height: 16),

          // Skip button
          Obx(() {
            if (controller.currentPage.value != controller.pages.length - 1) {
              return TextButton(
                onPressed: () => Get.offNamed('/login'),
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    ),
  );
}

Widget _buildDot(int index) {
  return Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: controller.currentPage.value == index ? 24 : 8,
        decoration: BoxDecoration(
          color: controller.currentPage.value == index
              ? AppColors.primary
              : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ));
}

}