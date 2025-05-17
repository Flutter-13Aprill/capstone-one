import 'package:flutter/material.dart';

class Product {
  final String? title;
  final String? imagePath;
  final double? price;
  final String? subtitle;
  final Widget? detailsPage;
  Product({
    this.subtitle,
    this.detailsPage,
    this.title,
    this.imagePath,
    this.price,
  });
}
