import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/models/onboarding_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  var currentPage = 0.obs;

  final List<OnboardingData> pages = [
    OnboardingData(
      title: 'Discover Amazing Products',
      description: 'Browse through thousands of products with the best deals',
      image: '🛍️',
    ),
    OnboardingData(
      title: 'Secure Payment',
      description: 'Multiple payment options with secure checkout process',
      image: '💳',
    ),
    OnboardingData(
      title: 'Fast Delivery',
      description: 'Get your products delivered right to your doorstep',
      image: '🚀',
    ),
  ];

  void nextPage({
    required Duration duration,
    required Curve curve,
  }) {
    pageController.nextPage(
      duration: duration,
      curve: curve,
    );
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
