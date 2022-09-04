import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebaseServices.dart';
import '../../models/UserModel.dart';
import '../home/home_screen.dart';
import 'components/check_out_card.dart';

class UsersCart extends StatefulWidget {
  UsersCart(
      {Key? key,
 })
  : super (key: key);
  static String routeName = "/UsersCart";




  @override
  State<UsersCart> createState() => _UsersCartState();
  UserModel userModel = UserModel();
  final FirebaseServices firebaseServices = FirebaseServices();
  User? currentUser = FirebaseAuth.instance.currentUser;


}





class _UsersCartState extends State<UsersCart> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      return Future.value(false);
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
            child: FutureBuilder<
                DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection("users")
                  .doc(currentUser!.uid.toString())
                  .get(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.data();
                  final userName = data?["phone no"] ?? "Shopper Chukwuma";
                  debugPrint(
                      " This is the user name for this user ${userName.toString()}");
                  return Container(
                    height: 45,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                      child: Text(
                        userName.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }

                return Center(
                    child: CircularProgressIndicator());
              },
            ),),
        bottomNavigationBar: CheckoutCard(),
      ),
    );
  }
}