import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String? productName;
  String? productId;
  String? productPrice;
  String? productImageUrl;
  String? numOfProducts;
  Timestamp? timeAdded;
  //List<dynamic>? cart;
  bool isCheckedOut;


  CartModel({
    this.productName,
    this.productId,
    this.productPrice,
    this.productImageUrl,
    this.numOfProducts,
    this.timeAdded,
   // this.cart,
    this.isCheckedOut = false,
  });

  factory CartModel.fromJson(json) {
    return CartModel(
      productName: json['productName']?? '',
      productId: json['productId']?? '',
      productPrice: json['productPrice']?? '',
      productImageUrl: json['productImageUrl']?? '',
      numOfProducts: json['numOfProducts']?? '',
      timeAdded: json['timeAdded']?? '',
     // cart: json['cart']?? '',
      isCheckedOut: json['isCheckedOut'],
    );
  }

  factory CartModel.fromFirestore(Map<String, dynamic> json) {
    return CartModel(
      productName: json['productName']?? '',
      productId: json['productId']?? '',
      productPrice: json['productPrice']?? '',
      productImageUrl: json['productImageUrl']?? '',
      numOfProducts: json['numOfProducts']?? '',
      timeAdded: json['timeAdded']?? '',
      //cart: json['cart']?? '',
      isCheckedOut: json['isCheckedOut']?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'productName' : productName,
    'productId' : productId,
    'productPrice' : productPrice,
    'productImageUrl' : productImageUrl,
    'numOfProducts' : numOfProducts,
    'timeAdded' : timeAdded,
    //'cart'  : cart,
    'isCheckedOut' : isCheckedOut,

  };

}