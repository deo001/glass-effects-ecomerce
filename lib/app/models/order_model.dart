import 'package:flutter/material.dart';

// Product inside an order
class OrderProduct {
  final String name;
  final String image;
  final int quantity;
  final double price;

  OrderProduct({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });
}

// Order Model
class Order {
  final String orderId;
  final String date;
  final List<OrderProduct> products;
  final int items;
  final double total;
  final String statusText;
  final String statusIcon;
  final Color statusColor;

  Order({
    required this.orderId,
    required this.date,
    required this.products,
    required this.items,
    required this.total,
    required this.statusText,
    required this.statusIcon,
    required this.statusColor,
  });
}
