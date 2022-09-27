import 'package:flutter/material.dart';

class Product {
  final int id;
  final String productName, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.productName,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2Fivm.jpg?alt=media&token=3ec14b9a-e8f0-4f5a-955e-4450e3fe0fb6",
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2Fivm1.jpg?alt=media&token=2f35e57a-b102-458a-8319-74db9e878eaf",
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2Fivm2.jpg?alt=media&token=dd3cb9e4-607d-4563-939b-a317d72759d3",
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2Fivm.jpg?alt=media&token=3ec14b9a-e8f0-4f5a-955e-4450e3fe0fb6",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    productName: "Ivm Yaris™",
    price: 100.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2Ftshirt.png?alt=media&token=547d8178-9eda-457c-801c-0fe20bc44592",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    productName: "Nike Sport White",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2FImage%20Popular%20Product%202.png?alt=media&token=647e1eb5-e027-4609-a5a7-b1d903f05b5f",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    productName: "Gloves XC Omega",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2FImage%20Popular%20Product%203.png?alt=media&token=0004a78e-a2d5-4b6d-a409-d1ee617ade5d",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    productName: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,

  ),

  Product(
    id: 5,
    images: [
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2FImage%20Popular%20Product%201.png?alt=media&token=2cd4bd4b-3632-4534-a696-090877993090",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    productName: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,

  ),

  Product(
    id: 6,
    images: [
      "https://firebasestorage.googleapis.com/v0/b/send-us-86dbd.appspot.com/o/Stores%2Fproduct%201%20image.png?alt=media&token=40283270-9cf7-450d-b919-ca8f738b96f5",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    productName: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,

  ),


];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
