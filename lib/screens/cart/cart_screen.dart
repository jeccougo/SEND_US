import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import '../home/home_screen.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        return Future.value(false);
        },
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
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
