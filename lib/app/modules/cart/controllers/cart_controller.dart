import 'package:get/get.dart';
import 'package:glass/app/models/cart_item_model.dart';
import 'package:glass/app/models/product_model.dart';


class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  double get shipping => cartItems.isEmpty ? 0 : 10.0;

  double get total => subtotal + shipping;

  void addToCart(Product product, {int quantity = 1}) {
    final index =
        cartItems.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      cartItems[index].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  void increaseQty(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decreaseQty(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}
