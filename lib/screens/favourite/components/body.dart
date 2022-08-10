import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 88,
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset("assets/images/ps4_console_white_1.png",),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'pad',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            maxLines: 2,
                          ),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: "\$100",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: kPrimaryColor),
                              children: [
                                TextSpan(
                                    text: " x10",
                                    style: Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                )
              ],


            ),
          ),


        ),
      ),
    );
  }
}
