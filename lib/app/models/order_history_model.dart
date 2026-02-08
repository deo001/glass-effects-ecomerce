import 'package:flutter/material.dart';

enum OrderStatus { processing, shipped, delivered, cancelled }

class Order {
  final String orderId;
  final String date;
  final OrderStatus status;
  final int items;
  final double total;
  final List<OrderProduct> products;

  Order({
    required this.orderId,
    required this.date,
    required this.status,
    required this.items,
    required this.total,
    required this.products,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.shipped:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.redAccent;
    }
  }

  String get statusIcon {
    switch (status) {
      case OrderStatus.processing:
        return '⏳';
      case OrderStatus.shipped:
        return '🚚';
      case OrderStatus.delivered:
        return '✅';
      case OrderStatus.cancelled:
        return '❌';
    }
  }
}

class OrderProduct {
  final String name;
  final String image;
  final int quantity;

  OrderProduct({
    required this.name,
    required this.image,
    required this.quantity,
  });
}
