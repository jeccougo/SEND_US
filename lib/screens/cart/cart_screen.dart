import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import '../../firebaseServices.dart';
import '../../models/CartModel.dart';
import '../home/home_screen.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  FirebaseServices firebaseServices = FirebaseServices();
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<CartModel> _cartList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        return Future.value(false);
        },
      child: Scaffold(
        appBar: buildAppBar(context),
        body: StreamBuilder(
            stream: firebaseServices.getUsersCart(currentUser!.uid.toString()),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapShot) {
              if (snapShot.hasError) {
                return Container();
              }

              if (snapShot.hasData) {
                _cartList.clear();

                /// clear list
                snapShot.data!.docs
                    .map((e) => _cartList
                    .add(CartModel.fromJson(e.data())))
                    .toList();
                return ListView(

                  children: [

                    ..._cartList
                        .map((element) => Body(cartModel: element)
                    )
                        .toList(),

                  ],
                );
              }
              return Container();
            }
        ),
        bottomNavigationBar: CheckoutCard(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
