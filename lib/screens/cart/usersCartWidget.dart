import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/CartModel.dart';
import 'components/body.dart';

import '../../firebaseServices.dart';
import '../../models/UserModel.dart';
import '../home/home_screen.dart';
import 'components/check_out_card.dart';

class UsersCart extends StatefulWidget {
  const UsersCart({Key? key,}) : super (key: key);
  static String routeName = "/UsersCart";

  @override
  _UsersCartState createState() => _UsersCartState();
}


class _UsersCartState extends State<UsersCart> {
  CartModel? cartModel;
  UserModel userModel = UserModel();
  final FirebaseServices firebaseServices = FirebaseServices();
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<CartModel> _cartList = [];




  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      return Future.value(false);
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
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
            )
        ),
        bottomNavigationBar: CheckoutCard(),
      ),
    );
  }
}