import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/widgets/cart_item_card.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/glass_container.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              /// HEADER
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    GlassContainer(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.zero,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: Get.back,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Obx(() => Text(
                          '${controller.cartItems.length} items',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        )),
                  ],
                ),
              ),

              /// CART ITEMS
              Expanded(
                child: Obx(() => ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.cartItems[index];

                        return Dismissible(
                          key: ValueKey(item.product.name),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => controller.removeItem(index),
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          child: CartItemCard(
                            item: item,
                            onQuantityChanged: (quantity) =>
                                controller.addToCart(item.product, quantity: quantity),
                                  
                                
                          ),
                        );
                      },
                    )),
              ),

              /// SUMMARY
              Obx(() => Container(
                    padding: const EdgeInsets.all(24),
                    child: GlassContainer(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          _summaryRow('Subtotal', controller.subtotal),
                          const SizedBox(height: 12),
                          _summaryRow('Shipping', controller.shipping),
                          const SizedBox(height: 12),
                          Divider(color: Colors.white.withOpacity(0.2)),
                          const SizedBox(height: 12),
                          _summaryRow(
                            'Total',
                            controller.total,
                            isTotal: true,
                          ),
                          const SizedBox(height: 24),
                          GlassButton(
                            text: 'Checkout',
                            icon: Icons.lock_outline,
                            width: double.infinity,
                            onPressed: () => Get.toNamed('/checkout'),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, double value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.white.withOpacity(0.7),
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(
            color: isTotal ? AppColors.primary : Colors.white,
            fontSize: isTotal ? 20 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
