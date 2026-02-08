import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/app/modules/cart/controllers/cart_controller.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/widgets/glass_button.dart';
import 'package:glass/widgets/glass_container.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.product;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  /// IMAGE
                  SliverToBoxAdapter(
                    child: AnimatedFadeSlide(
                      delay: 200,
                      child: Stack(
                        children: [
                          Container(
                            height: 400,
                            margin: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                product.image,
                                style: const TextStyle(fontSize: 120),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 40,
                            left: 40,
                            child: GlassContainer(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.zero,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: Get.back,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// DETAILS
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NAME + PRICE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          /// RATING
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          /// COLOR
                          const Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),

                          Obx(
                            () => Row(
                              children: List.generate(
                                controller.colors.length,
                                (index) => GestureDetector(
                                  onTap: () => controller.selectColor(index),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      color: controller.colors[index],
                                      shape: BoxShape.circle,
                                      border:
                                          controller.selectedColorIndex.value ==
                                              index
                                          ? Border.all(
                                              color: Colors.white,
                                              width: 3,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// SIZE
                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),

                          Obx(
                            () => Row(
                              children: List.generate(
                                controller.sizes.length,
                                (index) => GestureDetector(
                                  onTap: () => controller.selectSize(index),
                                  child: GlassContainer(
                                    width: 60,
                                    height: 50,
                                    opacity:
                                        controller.selectedSizeIndex.value ==
                                            index
                                        ? 0.3
                                        : 0.1,
                                    child: Center(
                                      child: Text(
                                        controller.sizes[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              /// BOTTOM BAR
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(24),
                    child: GlassContainer(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          /// QTY
                          GlassContainer(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: controller.decreaseQty,
                                ),
                                Text(
                                  controller.quantity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: controller.increaseQty,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          /// ADD TO CART
                          Expanded(
                            child: GlassButton(
                              text: 'Add to Cart',
                              icon: Icons.shopping_cart_outlined,
                              onPressed: () {
                                Get.snackbar(
                                  'Success',
                                  'Added ${controller.quantity} item(s)',
                                  snackPosition: SnackPosition.TOP,
                                );
                                final CartController cartController = Get.put(
                                  CartController(),
                                );
                                cartController.addToCart(
                                  controller.product,
                                  quantity: controller.quantity.value,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
