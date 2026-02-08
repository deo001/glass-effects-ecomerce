// lib/app/modules/splash_screen/controllers/splash_screen_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/routes/app_pages.dart';
import 'dart:math' as math;

class SplashScreenController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController logoController;
  late AnimationController particlesController;
  late Animation<double> logoScale;
  late Animation<double> logoFade;

  final RxList<Particle> particles = <Particle>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimations();
    _generateParticles();
    _navigateToOnboarding();
  }

  void _initializeAnimations() {
    // Logo Animation
    logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut,
      ),
    );

    logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Particles Animation
    particlesController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Start logo animation
    logoController.forward();
  }

  void _generateParticles() {
    final random = math.Random();
    for (int i = 0; i < 50; i++) {
      particles.add(
        Particle(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: random.nextDouble() * 4 + 2,
          speed: random.nextDouble() * 0.5 + 0.2,
          opacity: random.nextDouble() * 0.5 + 0.3,
        ),
      );
    }
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.ONBOARDING);
  }

  @override
  void onClose() {
    logoController.dispose();
    particlesController.dispose();
    super.onClose();
  }
}

// Particle Model
class Particle {
  double x;
  double y;
  final double size;
  final double speed;
  final double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}