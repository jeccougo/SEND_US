import 'package:flutter/material.dart';
import 'package:shop_app/models/Robanstorelist.dart';

import 'components/body.dart';


class RobanScreen extends StatelessWidget {
  static String routeName = "/robanstores";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Roban Stores",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${robanStorelistdemo.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
