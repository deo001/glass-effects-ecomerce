import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/app/models/payment_model.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/glass_container.dart';
import '../../cart/controllers/cart_controller.dart';

class CheckoutController extends GetxController {
  /// Text controllers
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final phoneController = TextEditingController();

  /// Selected payment method
  final selectedPaymentIndex = 0.obs;

  /// Payment methods
  final paymentMethods =  [
    PaymentMethod(id: '1', name: 'Credit Card', icon: '💳'),
    PaymentMethod(id: '2', name: 'PayPal', icon: '🅿️'),
    PaymentMethod(id: '3', name: 'Apple Pay', icon: '🍎'),
  ];

  /// Cart controller (to calculate total)
  final CartController cartController = Get.find();

  double get total => cartController.total;

  void selectPayment(int index) {
    selectedPaymentIndex.value = index;
  }

  void placeOrder() {
    if (!_isFormValid()) {
      Get.snackbar(
        'Missing Info',
        'Please fill all required fields',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    _showSuccessDialog();
    cartController.clearCart();
  }

  bool _isFormValid() {
    return nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        zipController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  void _showSuccessDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: GlassContainer(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.primary,
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your order has been placed successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 24),
              GlassButton(
                text: 'Continue Shopping',
                onPressed: () {
                  Get.offAllNamed('/home');
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
