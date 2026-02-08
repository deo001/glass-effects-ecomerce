// lib/app/modules/splash_screen/views/splash_screen_view.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/widgets/animated_glass_background.dart';
import '../controllers/splash_screen_controller.dart';
import 'package:glass/widgets/glass_container.dart';
import 'package:glass/app/core/constants/colors.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGlassBackground(
        child: SafeArea(
          child: Stack(
            children: [
              // Particles - Wrapped properly with Obx
              Center(
                child: AnimatedBuilder(
                  animation: controller.logoController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: controller.logoFade.value,
                      child: Transform.scale(
                        scale: controller.logoScale.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GlassContainer(
                              width: 180,
                              height: 180,
                              borderRadius: BorderRadius.circular(45),
                              opacity: 0.2,
                              blur: 25,
                              child: Stack(
                                children: [
                                  // Gradient Overlay
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          AppColors.primary.withOpacity(0.3),
                                          AppColors.secondary.withOpacity(0.3),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                  ),

                                  // Icon
                                  const Center(
                                    child: Text(
                                      '🛍️',
                                      style: TextStyle(fontSize: 80),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),

                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                ],
                              ).createShader(bounds),
                              child: const Text(
                                'ShopGlass',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            GlassContainer(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                              opacity: 0.15,
                              child: const Text(
                                'Premium Shopping Experience',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),

                            // Pulsing Dots Loader
                            _buildPulsingDots(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Bottom Info
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                  animation: controller.logoController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: controller.logoFade.value,
                      child: Column(
                        children: [
                          Text(
                            'Powered by Flutter',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Version 1.0.0',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPulsingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: controller.particlesController,
          builder: (context, child) {
            final delay = index * 0.2;
            final animValue =
                (controller.particlesController.value + delay) % 1.0;
            final scale = 0.5 + (math.sin(animValue * math.pi * 2) * 0.5);

            return Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(scale),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(scale * 0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

// Particles Painter
class ParticlesPainter extends CustomPainter {
  final List<Particle> particles;
  final Animation<double> animation;

  ParticlesPainter({required this.particles, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      // Update particle position
      particle.y = (particle.y - particle.speed * 0.001) % 1.0;

      final x = particle.x * size.width;
      final y = particle.y * size.height;

      paint.color = AppColors.primary.withOpacity(particle.opacity);
      canvas.drawCircle(Offset(x, y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlesPainter oldDelegate) => true;
}
