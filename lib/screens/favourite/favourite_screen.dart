

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'components/body.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),


    );
  }
}


AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Column(
      children: [
        GestureDetector(
          onTap: (){Navigator.of(context).pop();} ,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),

                  SvgPicture.asset(
                    "assets/icons/Back ICon.svg",
                    height: 20,
                  ),
                  SizedBox(width: 25,),
                  Text(
                    "Favourites",
                    style: TextStyle(color: Colors.black, fontSize: 25
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),


      ],
    ),
  );
}
