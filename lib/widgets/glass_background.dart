// lib/core/widgets/glass_background.dart
import 'package:flutter/material.dart';
import 'package:glass/app/core/constants/colors.dart';

class GlassBackground extends StatelessWidget {
  final Widget child;
  final bool showCircles;
  final BackgroundStyle style;

  const GlassBackground({
    Key? key,
    required this.child,
    this.showCircles = true,
    this.style = BackgroundStyle.dreamy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: _getGradient(),
      ),
      child: Stack(
        children: [
          if (showCircles) ...[
            _buildFloatingCircle(
              top: -100,
              right: -100,
              size: 300,
              color: AppColors.primary.withOpacity(0.1),
            ),
            _buildFloatingCircle(
              bottom: -150,
              left: -150,
              size: 400,
              color: AppColors.secondary.withOpacity(0.08),
            ),
            _buildFloatingCircle(
              top: 200,
              left: -50,
              size: 250,
              color: AppColors.accent.withOpacity(0.06),
            ),
            _buildFloatingCircle(
              bottom: 100,
              right: -80,
              size: 200,
              color: AppColors.primary.withOpacity(0.05),
            ),
          ],
          child,
        ],
      ),
    );
  }

LinearGradient _getGradient() {
  switch (style) {
    case BackgroundStyle.dreamy:
      return LinearGradient(
        colors: [
          AppColors.backgroundStart.withOpacity(0.3),
          AppColors.backgroundMid.withOpacity(0.3),
          AppColors.backgroundEnd.withOpacity(0.3),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.4, 1.0],
      );
    case BackgroundStyle.mesh:
      return LinearGradient(
        colors: [
          AppColors.backgroundStart.withOpacity(0.25),
          AppColors.backgroundMid.withOpacity(0.25),
          AppColors.backgroundEnd.withOpacity(0.25),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.5, 1.0],
      );
    default:
      return AppColors.backgroundGradient;
  }
}

  Widget _buildFloatingCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required Color color,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color,
              color.withOpacity(0.3),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}

enum BackgroundStyle {
  standard,
  purple,
  blue,
  cosmic,
  dreamy,
  mesh,
}