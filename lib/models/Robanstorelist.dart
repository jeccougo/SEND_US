import 'package:flutter/material.dart';


import 'RobanProduct.dart';
//import 'Product.dart';

class Robanstorelist {
  final RobanProduct product;
  final int numOfItem;

  Robanstorelist({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Robanstorelist> robanStorelistdemo = [
  Robanstorelist(product: demoProducts[0], numOfItem: 2),
  Robanstorelist(product: demoProducts[1], numOfItem: 1),
  Robanstorelist(product: demoProducts[3], numOfItem: 1),
  Robanstorelist(product: demoProducts[0], numOfItem: 2),
  Robanstorelist(product: demoProducts[1], numOfItem: 1),
  Robanstorelist(product: demoProducts[3], numOfItem: 1),
  Robanstorelist(product: demoProducts[0], numOfItem: 2),
  Robanstorelist(product: demoProducts[1], numOfItem: 1),
  Robanstorelist(product: demoProducts[3], numOfItem: 1),
];
