import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? secretCode;
  String? username;
  String? imageUrl;
  String? gender;
  Timestamp? timeRegistered;
  List<dynamic>? cart;
  bool flagged;


  UserModel({
    this.email,
    this.secretCode,
    this.username,
    this.imageUrl,
    this.gender,
    this.timeRegistered,
    this.cart,
    this.flagged = false,
});

  factory UserModel.fromJson(json) {
    return UserModel(
        email: json['email']?? '',
        secretCode: json['secretCode']?? '',
        username: json['username']?? '',
        imageUrl: json['imageUrl']?? '',
        gender: json['gender']?? '',
        timeRegistered: json['timeRegistered']?? '',
        cart: json['cart']?? '',
        flagged: json['flagged'],
    );
  }

  factory UserModel.fromFirestore(Map<String, dynamic> json) {
    return UserModel(
      email: json['email']?? '',
      secretCode: json['secretCode']?? '',
      username: json['username']?? '',
      imageUrl: json['imageUrl']?? '',
      gender: json['gender']?? '',
      timeRegistered: json['timeRegistered']?? '',
      cart: json['cart']?? '',
      flagged: json['flagged']?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'email' : email,
    'secretCode' : secretCode,
    'username' : username,
    'imageUrl' : imageUrl,
    'gender' : gender,
    'timeRegistered' : timeRegistered,
    'cart'  : cart,
    'flagged' : flagged,

  };

}