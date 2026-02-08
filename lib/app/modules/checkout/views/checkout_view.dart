import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/glass_container.dart';
import 'package:glass/widgets/text_field.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24),
                child: AnimatedFadeSlide(
                  delay: 200,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: GlassContainer(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.zero,
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Shipping Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GlassTextField(controller: controller.nameController, hintText: 'Full Name', icon: Icons.person_outline),
                      const SizedBox(height: 16),
                      GlassTextField(controller: controller.addressController, hintText: 'Address', icon: Icons.home_outlined),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: GlassTextField(controller: controller.cityController, hintText: 'City', icon: Icons.location_city_outlined)),
                          const SizedBox(width: 16),
                          Expanded(child: GlassTextField(controller: controller.zipController, hintText: 'ZIP Code', icon: Icons.mail_outline, keyboardType: TextInputType.number)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GlassTextField(controller: controller.phoneController, hintText: 'Phone Number', icon: Icons.phone_outlined, keyboardType: TextInputType.phone),
                      const SizedBox(height: 32),

                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),

                      Obx(() => Column(
                            children: List.generate(
                              controller.paymentMethods.length,
                              (index) {
                                final method = controller.paymentMethods[index];
                                final isSelected = controller.selectedPaymentIndex.value == index;
                                return GestureDetector(
                                  onTap: () => controller.selectPayment(index),
                                  child: GlassContainer(
                                    opacity: isSelected ? 0.2 : 0.1,
                                    border: Border.all(
                                      color: isSelected ? AppColors.primary : Colors.white.withOpacity(0.2),
                                      width: isSelected ? 2 : 1.5,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(method.icon, style: const TextStyle(fontSize: 32)),
                                        const SizedBox(width: 16),
                                        Text(
                                          method.name,
                                          style: TextStyle(
                                            color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                          ),
                                        ),
                                        const Spacer(),
                                        if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),

              // Place Order Button
              Obx(() => AnimatedFadeSlide(
                    delay: 1400,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: GlassButton(
                        text: 'Place Order - \$${controller.total.toStringAsFixed(2)}',
                        icon: Icons.check_circle_outline,
                        onPressed: controller.placeOrder,
                        width: double.infinity,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
