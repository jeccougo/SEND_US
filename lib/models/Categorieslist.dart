import 'package:flutter/material.dart';


import 'RobanProduct.dart';
//import 'Product.dart';

class Categorieslist {
  final RobanProduct product;
  final int numOfItem;

  Categorieslist({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Categorieslist> robanStorelistdemo = [
  Categorieslist(product: demoProducts[0], numOfItem: 2),
  Categorieslist(product: demoProducts[1], numOfItem: 1),
  Categorieslist(product: demoProducts[3], numOfItem: 1),
  Categorieslist(product: demoProducts[0], numOfItem: 2),
  Categorieslist(product: demoProducts[1], numOfItem: 1),
  Categorieslist(product: demoProducts[3], numOfItem: 1),
  Categorieslist(product: demoProducts[0], numOfItem: 2),
  Categorieslist(product: demoProducts[1], numOfItem: 1),
  Categorieslist(product: demoProducts[3], numOfItem: 1),
];
