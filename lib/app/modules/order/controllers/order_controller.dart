import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:glass/app/models/order_model.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadOrders();
  }

  void _loadOrders() {
    // Sample Orders
    orders.assignAll([
      Order(
        orderId: '#12345',
        date: 'Feb 8, 2026',
        products: [
          OrderProduct(name: 'Headphones', image: '🎧', quantity: 1, price: 199.99),
          OrderProduct(name: 'Smart Watch', image: '⌚', quantity: 1, price: 299.99),
          OrderProduct(name: 'Laptop Stand', image: '💻', quantity: 1, price: 49.99),
        ],
        items: 3,
        total: 549.97,
        statusText: 'Shipped',
        statusIcon: '🚚',
        statusColor: Colors.green,
      ),
      Order(
        orderId: '#12346',
        date: 'Feb 5, 2026',
        products: [
          OrderProduct(name: 'Keyboard', image: '⌨️', quantity: 1, price: 99.99),
        ],
        items: 1,
        total: 99.99,
        statusText: 'Processing',
        statusIcon: '⏳',
        statusColor: Colors.orange,
      ),
    ]);
  }

  void addOrder(Order order) {
    orders.add(order);
  }
}
