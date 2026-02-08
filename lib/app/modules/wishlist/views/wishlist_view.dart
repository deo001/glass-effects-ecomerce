import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/widgets/product_card.dart';
import '../controllers/wishlist_controller.dart';
import 'package:glass/widgets/glass_container.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/app/core/constants/colors.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Wishlist ❤️',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Obx(() => Text(
                                '${controller.wishlistItems.length} items saved',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              )),
                        ],
                      ),
                      GlassContainer(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedFadeSlide(
                  delay: 400,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.snackbar(
                              'Success',
                              'All items added to cart!',
                              backgroundColor: AppColors.primary.withOpacity(0.8),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP,
                              margin: const EdgeInsets.all(16),
                              borderRadius: 12,
                            );
                          },
                          child: GlassContainer(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Add All to Cart',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => _showClearAllDialog(context),
                        child: GlassContainer(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.zero,
                          child: const Icon(Icons.delete_outline, color: AppColors.accent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Wishlist Items Grid
              Expanded(
                child: Obx(() {
                  final items = controller.wishlistItems;
                  if (items.isEmpty) return _buildEmptyWishlist();
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final product = items[index];
                      return AnimatedFadeSlide(
                        delay: 600 + (index * 100),
                        child: ProductCard(
                          product: product,
                          onTap: () => Get.toNamed('/product-details', arguments: product),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyWishlist() {
    return Center(
      child: AnimatedFadeSlide(
        delay: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('💔', style: TextStyle(fontSize: 80)),
            SizedBox(height: 24),
            Text(
              'Your wishlist is empty',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 12),
            Text(
              'Start adding products you love!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassContainer(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Clear Wishlist?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to remove all items from your wishlist?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: GlassContainer(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        opacity: 0.1,
                        child: const Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.clearWishlist();
                        Get.back();
                      },
                      child: GlassContainer(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        opacity: 0.2,
                        border: Border.all(color: AppColors.accent, width: 2),
                        child: const Text(
                          'Clear All',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
