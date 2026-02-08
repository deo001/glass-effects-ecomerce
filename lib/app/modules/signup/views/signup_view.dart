import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/glass_container.dart';
import 'package:glass/widgets/text_field.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

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
                // Back
                AnimatedFadeSlide(
                  delay: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: Get.back,
                  ),
                ),

                const SizedBox(height: 20),

                AnimatedFadeSlide(
                  delay: 200,
                  child: const Text(
                    'Create\nAccount 🚀',
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
                    'Sign up to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Name
                AnimatedFadeSlide(
                  delay: 600,
                  child: GlassTextField(
                    controller: controller.nameController,
                    hintText: 'Full Name',
                    icon: Icons.person_outline,
                  ),
                ),

                const SizedBox(height: 20),

                // Email
                AnimatedFadeSlide(
                  delay: 700,
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

                const SizedBox(height: 20),

                // Confirm Password
                AnimatedFadeSlide(
                  delay: 900,
                  child: Obx(
                    () => GlassTextField(
                      controller: controller.confirmPasswordController,
                      hintText: 'Confirm Password',
                      icon: Icons.lock_outline,
                      obscureText: controller.obscureConfirmPassword.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscureConfirmPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        onPressed: controller.toggleConfirmPassword,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Terms
                AnimatedFadeSlide(
                  delay: 1000,
                  child: Obx(
                    () => Row(
                      children: [
                        GestureDetector(
                          onTap: controller.toggleTerms,
                          child: GlassContainer(
                            width: 24,
                            height: 24,
                            padding: EdgeInsets.zero,
                            child: controller.agreedToTerms.value
                                ? const Icon(
                                    Icons.check,
                                    color: AppColors.primary,
                                    size: 18,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                              ),
                              children: const [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
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

                const SizedBox(height: 32),

                // Sign Up
                AnimatedFadeSlide(
                  delay: 1200,
                  child: GlassButton(
                    text: 'Sign Up',
                    width: double.infinity,
                    onPressed: () {
                      if (controller.agreedToTerms.value) {
                        controller.signup.call();
                      }
                    },
                  ),
                ),

                const SizedBox(height: 32),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
