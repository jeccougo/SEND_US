import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

import 'models/CartModel.dart';
import 'models/Product.dart';
import 'models/UserModel.dart';

SharedPreferences? prefs;

class FirebaseServices extends ChangeNotifier {
  /// create instance of Firestore
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// create instance of FirebaseMessaging
 // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  User? currentUser = FirebaseAuth.instance.currentUser;
  final String usersKey = 'user';
  final String alterEgoKey = 'alterEgo';
  final String alterEgoAccessCodeKey = 'alterEgoAccessCodeKey';
  String? _usersID;
  final String userKey ='user';


  //var sharedPreference = SharedPreference.instance;
  UserModel? user;
  UserModel userModel = UserModel();



  ///cache user id
  void setUserId(String id) async{
    await getUserWithId(id: id);
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(userKey, id);
  }

  /// get users id
  Future<String> getUsersId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(usersKey) ?? '';
  }

  ///get user id
  Future<UserModel> getUserWithId({String? id}) async{
    final _info =
    await _firebaseFirestore.collection("users").doc(id).get();
    final _data = UserModel.fromFirestore(_info.data()!);
    return _data;
  }



  /// checks if a user is signed in or not
  /// if the use is not signed in
  /// then request them to sign in
  Future<bool> isUserSignIn(BuildContext context) async {
    _usersID = await getUsersId();
    if (_usersID!.isEmpty) {
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      return false;
    }
    return true;
  }


  /// Get user info

  Future<UserModel> getUserInfo() async {
    _usersID = await getUsersId();
    DocumentSnapshot response = await _firebaseFirestore
        .collection('users')
        .doc(_usersID)
        .get();

    var user = UserModel.fromFirestore(response.data() as Map<String, dynamic>);
    return user;
  }



  /// SignUp user
  Future<bool> register(
      BuildContext context, String email, String secretCode, String userName,) async {
    final _user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: secretCode);
    final _email = email;
    final _userName = userName;
    final _secretCode = secretCode;

    try {
      final email = _email;
      final userName = _userName;
      final secretCode = _secretCode;
      final timeRegistered = FieldValue.serverTimestamp();
      final userId = _user.user?.uid;

      FirebaseFirestore.instance
          .collection("users")
          .doc(_user.user!.uid)
          .set({
        "userId": userId,
        "userName": userName,
        "email": email,
        "secretCode": secretCode,
        "timeRegistered": timeRegistered,
      },
      );
      print('Email: $email');
      print('User Id: $userId');
      print('Secret Code: $secretCode');

      setUserId(_user.user!.uid);

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: secretCode)
          .then((value) => {
        setUserId(value.user!.uid),
      });

      Navigator.pushNamed(context, HomeScreen.routeName);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code.length < 4) {
      } else if (e.code == 'email-already-in-use') {
      }
      return false;
    } catch (e) {
      return false;
    }
  }



  ///Authenticate the user in
  Future<bool> signIn(
      BuildContext context, String email, String secretCode) async {
    final _user;
    try {
      _user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: secretCode)
          .then((value) => {
        setUserId(value.user!.uid)
      });
      Navigator.pushNamed(context, HomeScreen.routeName);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void addToCart(BuildContext context, Product product) async {
   // if (!await isUserSignIn(context)) return;
    final userId = currentUser?.uid.toString();


    CollectionReference ref =
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("userCart");

    String docId = ref.doc().id;

    final _cartModel = CartModel(

        timeAdded: Timestamp.now(),
        productImageUrl: product.images.first,
        productName: product.title,
        productPrice: product.price.toString()
    );

    await ref.doc(docId).set(_cartModel.toJson());

  }


  /// [featured Session Comments] -> get users featured sessions comments
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersCart(
      String id) {
    return _firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('userCart')
       // .orderBy('timeCreated', descending: false)
        .snapshots();
  }






  }


