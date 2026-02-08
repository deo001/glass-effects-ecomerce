import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import 'package:glass/app/routes/app_pages.dart';
import 'package:glass/widgets/animated_fade_slide.dart';
import 'package:glass/widgets/category_card.dart';
import 'package:glass/widgets/glass_background.dart';
import 'package:glass/widgets/glass_container.dart';
import 'package:glass/widgets/product_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassBackground(
        style: BackgroundStyle.dreamy, // or mesh for more cosmic glass
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              _buildHeader(),
              _buildCategories(),
              _buildNewArrivalsTitle(),
              _buildProductGrid(),
              _buildRecommendedTitle(),
              _buildRecommendedList(),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ---------------- HEADER ----------------

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedFadeSlide(
              delay: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello! 👋',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Let's go shopping",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/cart'),
                    child: GlassContainer(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            AnimatedFadeSlide(
              delay: 400,
              child: GlassContainer(
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.white.withOpacity(0.7)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- CATEGORIES ----------------

  SliverToBoxAdapter _buildCategories() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 125,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            // Only the CategoryCard's selected state depends on Rx
            return AnimatedFadeSlide(
              delay: 600 + index * 100,
              child: Obx(
                () => CategoryCard(
                  category: controller.categories[index],
                  isSelected: controller.selectedCategory.value == index,
                  onTap: () => controller.selectCategory(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------------- PRODUCTS ----------------

  SliverToBoxAdapter _buildNewArrivalsTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AnimatedFadeSlide(
          delay: 800,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverPadding _buildProductGrid() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = controller.products[index];
          return AnimatedFadeSlide(
            delay: 1000 + index * 100,
            child: ProductCard(
              product: product,
              onTap: () => Get.toNamed('/product-details', arguments: product),
            ),
          );
        }, childCount: controller.products.length),
      ),
    );
  }

  SliverToBoxAdapter _buildRecommendedTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AnimatedFadeSlide(
          delay: 1400,
          child: const Text(
            'Recommended for You',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRecommendedList() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return AnimatedFadeSlide(
              delay: 1600 + index * 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 180,
                  child: ProductCard(
                    product: controller.products[index],
                    onTap: () => Get.toNamed('/product-details'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------------- BOTTOM NAV ----------------
  Widget _buildBottomNav() {
    return AnimatedFadeSlide(
      delay: 1800,
      child: Container(
        margin: const EdgeInsets.all(24),
        child: GlassContainer(
          blur: 15,
          opacity: 0.15,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final icons = [
                  Icons.home,
                  Icons.favorite_border,
                  Icons.receipt_long_outlined,
                  Icons.person_outline,
                ];
                final labels = ['Home', 'Wishlist', 'Orders', 'Profile'];
                final routes = [
                  Routes.HOME,
                  Routes.WISHLIST,
                  Routes.ORDER,
                  Routes.PROFILE,
                ];

                final isActive = controller.selectedBottomNav.value == index;
                final color = isActive
                    ? AppColors.primary
                    : AppColors.secondary.withOpacity(0.5);

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.selectBottomNav(index);
                      // Navigate using Get.toNamed
                      Get.toNamed(routes[index]);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icons[index], color: color, size: 26),
                        const SizedBox(height: 4),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: color,
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
