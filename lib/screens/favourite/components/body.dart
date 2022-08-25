import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import '../../cart/components/cart_card.dart';
import '../../home/home_screen.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      return Future.value(false);
    },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: demoCarts[index]),
            ),
          ),
        ),
      ),
    );

  }
}
