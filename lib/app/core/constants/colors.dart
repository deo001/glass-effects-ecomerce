// lib/core/constants/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - More vibrant and glassy
  static const primary = Color(0xFF6C5CE7);
  static const secondary = Color(0xFFA29BFE);
  static const accent = Color(0xFFFF7675);
  
  // Glass Background Colors - Softer, more translucent feel
  static const backgroundStart = Color(0xFF0F0F1E);
  static const backgroundMid = Color(0xFF1A1A2E);
  static const backgroundEnd = Color(0xFF16213E);
  
  // Accent background colors for variety
  static const glassBlue = Color(0xFF2D3561);
  static const glassPurple = Color(0xFF2E1F47);
  static const glassPink = Color(0xFF3D2C4D);
  
  // Card backgrounds
  static const cardBackground = Color(0xFF2A2A3E);
  
  // Primary Gradient - Vibrant glass effect
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Main Background Gradient - Softer, more glass-like
  static LinearGradient backgroundGradient = LinearGradient(
    colors: [
      backgroundStart,
      backgroundMid,
      backgroundEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.0, 0.5, 1.0],
  );
  
  // Alternative Background 1 - Purple tint
  static LinearGradient backgroundGradientPurple = LinearGradient(
    colors: [
      Color(0xFF0F0F1E),
      Color(0xFF1F1B2E),
      Color(0xFF2E1F47),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.0, 0.5, 1.0],
  );
  
  // Alternative Background 2 - Blue tint
  static LinearGradient backgroundGradientBlue = LinearGradient(
    colors: [
      Color(0xFF0A0E27),
      Color(0xFF1A1F3A),
      Color(0xFF2D3561),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.0, 0.6, 1.0],
  );
  
  // Alternative Background 3 - Cosmic glass
  static LinearGradient backgroundGradientCosmic = LinearGradient(
    colors: [
      Color(0xFF0D0D1E),
      Color(0xFF1A1535),
      Color(0xFF2A1B3D),
      Color(0xFF1E3A5F),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.0, 0.3, 0.7, 1.0],
  );
  
  // Alternative Background 4 - Dreamy glass (Recommended for glass effect)
  static LinearGradient backgroundGradientDreamy = LinearGradient(
    colors: [
      Color(0xFF0B0B1A),
      Color(0xFF1C1534),
      Color(0xFF2D2552),
      Color(0xFF1F3A5F),
    ],
    begin: Alignment(-1.0, -1.0),
    end: Alignment(1.0, 1.0),
    stops: const [0.0, 0.4, 0.7, 1.0],
  );
  
  // Mesh Gradient Background - Most glass-like effect
  static LinearGradient backgroundGradientMesh = LinearGradient(
    colors: [
      Color(0xFF0A0A18),
      Color(0xFF1A1433),
      Color(0xFF2A1F47),
      Color(0xFF1F2E5C),
      Color(0xFF152238),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
  );
  
  // Radial gradient for special effects
  static RadialGradient backgroundRadialGradient = RadialGradient(
    colors: [
      Color(0xFF2D3561).withOpacity(0.3),
      Color(0xFF1A1A2E).withOpacity(0.8),
      Color(0xFF0F0F1E),
    ],
    stops: const [0.0, 0.5, 1.0],
    center: Alignment.topRight,
    radius: 1.5,
  );
  
  // Glass overlay colors
  static Color glassWhite = Colors.white.withOpacity(0.1);
  static Color glassBorder = Colors.white.withOpacity(0.2);}