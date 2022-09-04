// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/firebaseServices.dart';
import 'package:shop_app/models/UserModel.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  UserModel userModel = UserModel();
  final FirebaseServices firebaseServices = FirebaseServices();
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
  getUser();
    super.initState();
  }

  void getUser() async {
    userModel = await firebaseServices.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 250.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/profilef.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 25.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0, bottom: 15.0,),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: FutureBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                  future: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(currentUser!.uid)
                                      .get(),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.data();
                                      final userName = data?["userName"] ?? "Shopper Chukwuma";
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
                                ),
                              ),
                            ],
                          )),



                      Padding(
                          padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0, bottom: 15.0,),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: FutureBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                  future: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(currentUser!.uid)
                                      .get(),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.data();
                                      final userName = data?["email"] ?? "Shopper Chukwuma";
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
                                ),
                              ),
                            ],
                          )),




                      Padding(
                          padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0, bottom: 15.0,),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Phone No:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),



                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: FutureBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                  future: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(currentUser!.uid)
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
                                ),
                              ),
                            ],
                          )),



                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Pin Code"),
                                    enabled: !_status,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextField(
                                  decoration: const InputDecoration(
                                      hintText: "Enter State"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      !_status ? _getActionButtons() : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text("Save"),
              )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text("Cancel"),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
