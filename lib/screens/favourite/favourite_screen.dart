import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import 'components/body.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

    );
  }
}


AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Column(
      children: [
        Text(
            "Favourites",
          style: TextStyle(color: Colors.black),
        ),

      ],
    ),
  );
}
