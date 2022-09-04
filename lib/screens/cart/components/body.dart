import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/CartModel.dart';
import 'package:shop_app/screens/cart/usersCartWidget.dart';

import '../../../firebaseServices.dart';
import '../../../models/Product.dart';
import '../../../models/UserModel.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
  UserModel userModel = UserModel();
  final FirebaseServices firebaseServices = FirebaseServices();
  User? currentUser = FirebaseAuth.instance.currentUser;
  final List<CartModel> _cartList = [];

  late final Product product;
  late final int numOfItem;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // Padding(
        //  padding:
        //  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        //  child: ListView.builder(
        //    itemCount: demoCarts.length,
         //   itemBuilder: (context, index) => Padding(
          //    padding: EdgeInsets.symmetric(vertical: 10),
         //     child: Dismissible(
         //       key: Key(demoCarts[index].product.id.toString()),
          //      direction: DismissDirection.endToStart,
          //      onDismissed: (direction) {
           //       setState(() {
          //          demoCarts.removeAt(index);
          //        });
         //       },
          //      background: Container(
          //        padding: EdgeInsets.symmetric(horizontal: 20),
           //       decoration: BoxDecoration(
          //          color: Colors.blue,
          //          borderRadius: BorderRadius.circular(15),
          //        ),
          //        child: Row(
          //          children: [
           //           Spacer(),
            //          SvgPicture.asset("assets/icons/Trash.svg"),
             //       ],
              //    ),
              //  ),
              //  child: CartCard(cart: demoCarts[index]),
            //  ),
          //  ),
        //  ),
      //  ),






        Expanded(
          child: StreamBuilder(
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
                  return SingleChildScrollView(
                    child: Column(

                      children: [

                        ..._cartList
                            .map((element) => UsersCart()
                        )
                            .toList(),

                      ],
                    ),
                  );
                }
                return Container();
              }
          ),
        )
      ],
    );
  }
}
