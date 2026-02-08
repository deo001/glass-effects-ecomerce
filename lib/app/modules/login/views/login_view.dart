import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/soocial_button.dart';
import 'package:glass/widgets/text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: AppColors.backgroundGradientDreamy),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Title
                AnimatedFadeSlide(
                  delay: 200,
                  child: const Text(
                    'Welcome\nBack! 👋',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                AnimatedFadeSlide(
                  delay: 400,
                  child: Text(
                    'Login to continue shopping',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Email
                AnimatedFadeSlide(
                  delay: 600,
                  child: GlassTextField(
                    controller: controller.emailController,
                    hintText: 'Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                const SizedBox(height: 20),

                // Password
                AnimatedFadeSlide(
                  delay: 800,
                  child: Obx(
                    () => GlassTextField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: controller.obscurePassword.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        onPressed: controller.togglePassword,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Forgot password
                AnimatedFadeSlide(
                  delay: 1000,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Login button
                AnimatedFadeSlide(
                  delay: 1200,
                  child: GlassButton(
                    text: 'Login',
                    width: double.infinity,
                    onPressed: controller.login,
                  ),
                ),

                const SizedBox(height: 24),

                // Divider
                AnimatedFadeSlide(
                  delay: 1400,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.3)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.3)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Social login
                AnimatedFadeSlide(
                  delay: 1600,
                  child: Row(
                    children: [
                      Expanded(
                        child: SocialLoginButton(
                          icon: '🔍',
                          label: 'Google',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SocialLoginButton(
                          icon: '📱',
                          label: 'Apple',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Sign up
                AnimatedFadeSlide(
                  delay: 1800,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/signup'),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
