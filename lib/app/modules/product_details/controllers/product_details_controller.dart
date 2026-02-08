import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/app/core/constants/colors.dart';
import '../../../models/product_model.dart';

class ProductDetailsController extends GetxController {
  late final Product product;

  var quantity = 1.obs;
  final selectedColorIndex = 0.obs;
  final selectedSizeIndex = 1.obs;

  final colors = <Color>[
    AppColors.primary,
    AppColors.accent,
    Colors.green,
    Colors.orange,
  ];

  final sizes = ['S', 'M', 'L', 'XL'];

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as Product;
  }

  void increaseQty() => quantity++;
  void decreaseQty() {
    if (quantity > 1) quantity--;
  }

  void selectColor(int index) => selectedColorIndex.value = index;
  void selectSize(int index) => selectedSizeIndex.value = index;
}
