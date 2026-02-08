import 'package:get/get.dart';
import 'package:glass/app/models/order_history_model.dart';

class OrderHistoryController extends GetxController {
  var orders = <Order>[].obs;

  var selectedTab = 0.obs; // 0 = All, 1 = Processing, 2 = Shipped, etc.

  @override
  void onInit() {
    super.onInit();
    _loadOrders();
  }

  void _loadOrders() {
    orders.assignAll([
      Order(
        orderId: 'ORD-2024-001',
        date: '2024-02-05',
        status: OrderStatus.delivered,
        items: 3,
        total: 549.97,
        products: [
          OrderProduct(name: 'Wireless Headphones', image: '🎧', quantity: 1),
          OrderProduct(name: 'Smart Watch', image: '⌚', quantity: 1),
          OrderProduct(name: 'Laptop Stand', image: '💻', quantity: 1),
        ],
      ),
      Order(
        orderId: 'ORD-2024-002',
        date: '2024-02-03',
        status: OrderStatus.shipped,
        items: 2,
        total: 349.98,
        products: [
          OrderProduct(name: 'Coffee Maker', image: '☕', quantity: 2),
        ],
      ),
      Order(
        orderId: 'ORD-2024-003',
        date: '2024-02-01',
        status: OrderStatus.processing,
        items: 1,
        total: 1299.99,
        products: [
          OrderProduct(name: 'Premium Laptop', image: '💻', quantity: 1),
        ],
      ),
      Order(
        orderId: 'ORD-2024-004',
        date: '2024-01-28',
        status: OrderStatus.cancelled,
        items: 2,
        total: 229.98,
        products: [
          OrderProduct(name: 'Gaming Mouse', image: '🖱️', quantity: 1),
          OrderProduct(name: 'Desk Lamp', image: '💡', quantity: 1),
        ],
      ),
    ]);
  }

  List<Order> get filteredOrders {
    if (selectedTab.value == 0) return orders;
    final status = OrderStatus.values[selectedTab.value - 1];
    return orders.where((order) => order.status == status).toList();
  }

  void selectTab(int index) {
    selectedTab.value = index;
  }
}
