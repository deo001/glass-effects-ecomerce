import 'package:get/get.dart';
import 'package:glass/app/models/category_model.dart';
import 'package:glass/app/models/product_model.dart';

class HomeController extends GetxController {
  var selectedCategory = 0.obs;
  var selectedBottomNav = 0.obs;

final categories = [
  Category(id: 'all', name: 'All', icon: '🎯'),
  Category(id: 'electronics', name: 'Electronics', icon: '📱'),
  Category(id: 'fashion', name: 'Fashion', icon: '👕'),
  Category(id: 'home', name: 'Home', icon: '🏠'),
  Category(id: 'sports', name: 'Sports', icon: '⚽'),
];

final products = [
  Product(
    id: '1',
    name: 'Wireless Headphones',
    price: 199.99,
    image: '🎧',
    rating: 4.5,
    categoryId: 'electronics',
    isNew: true,
  ),
  Product(
    id: '2',
    name: 'Smart Watch',
    price: 299.99,
    image: '⌚',
    rating: 4.8,
    categoryId: 'electronics',
    isRecommended: true,
  ),
  Product(
    id: '3',
    name: 'Laptop Stand',
    price: 49.99,
    image: '💻',
    rating: 4.3,
    categoryId: 'home',
  ),
  Product(
    id: '4',
    name: 'Coffee Maker',
    price: 89.99,
    image: '☕',
    rating: 4.6,
    categoryId: 'home',
    isNew: true,
  ),
];

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  void selectBottomNav(int index) {
    selectedBottomNav.value = index;
  }
}
