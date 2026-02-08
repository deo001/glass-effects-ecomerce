import 'package:get/get.dart';
import 'package:glass/app/models/product_model.dart';

class WishlistController extends GetxController {
  var wishlistItems = <Product>[
    Product(
      id: 1.toString(),
      categoryId: 101.toString(),
      name: 'Premium Laptop',
      price: 1299.99,
      image: '💻',
      rating: 4.8,
      isRecommended: true,
    ),
    Product(
      id: 2.toString(),
      categoryId: 102.toString(),
      name: 'Gaming Mouse',
      price: 79.99,
      image: '🖱️',
      rating: 4.6,
    ),
    Product(
      id: 3.toString(),
      categoryId: 102.toString(),
      name: 'Mechanical Keyboard',
      price: 149.99,
      image: '⌨️',
      rating: 4.7,
      isNew: true,
    ),
    Product(
      id: 4.toString(),
      categoryId: 103.toString(),
      name: 'Monitor 4K',
      price: 599.99,
      image: '🖥️',
      rating: 4.9,
    ),
    Product(
      id: 5.toString(),
      categoryId: 104.toString(),
      name: 'Webcam HD',
      price: 89.99,
      image: '📷',
      rating: 4.5,
    ),
    Product(
      id: '6',
      categoryId: '105',
      name: 'Desk Lamp',
      price: 45.99,
      image: '💡',
      rating: 4.4,
    ),
  ].obs;

  void clearWishlist() => wishlistItems.clear();
}
