// lib/core/widgets/animated_glass_background.dart
import 'package:flutter/material.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'dart:math' as math;

class AnimatedGlassBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGlassBackground({Key? key, required this.child}) : super(key: key);

  @override
  State<AnimatedGlassBackground> createState() => _AnimatedGlassBackgroundState();
}

class _AnimatedGlassBackgroundState extends State<AnimatedGlassBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    
    _controller1 = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller2 = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _controller3 = AnimationController(
      duration: const Duration(seconds: 25),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.backgroundGradientDreamy,
      ),
      child: Stack(
        children: [
          // Animated blob 1
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Positioned(
                top: -100 + (math.sin(_controller1.value * 2 * math.pi) * 50),
                right: -100 + (math.cos(_controller1.value * 2 * math.pi) * 50),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.15),
                        AppColors.primary.withOpacity(0.05),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Animated blob 2
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Positioned(
                bottom: -150 + (math.cos(_controller2.value * 2 * math.pi) * 60),
                left: -150 + (math.sin(_controller2.value * 2 * math.pi) * 60),
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.secondary.withOpacity(0.12),
                        AppColors.secondary.withOpacity(0.04),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Animated blob 3
          AnimatedBuilder(
            animation: _controller3,
            builder: (context, child) {
              return Positioned(
                top: 200 + (math.sin(_controller3.value * 2 * math.pi) * 40),
                left: -50 + (math.cos(_controller3.value * 2 * math.pi) * 40),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.accent.withOpacity(0.1),
                        AppColors.accent.withOpacity(0.03),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          widget.child,
        ],
      ),
    );
  }
}