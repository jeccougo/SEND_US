import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),


            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(

                child: InkWell(
                  child: ListTile(
                    title: const Text('My Account'),
                    leading: Icon(Icons.account_circle,
                      color: Colors.blue,),
                    onTap: () {
                    },
                  ),
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(

                borderRadius: BorderRadius.circular(10),
                hoverColor: Colors.red.shade500,
                child: ListTile(
                  title: Text('My Orders'),

                  leading: const Icon(Icons.shopping_basket,
                    color: Colors.blue,),
                  onTap: () {
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                child: ListTile(
                  title: const Text('Settings'),
                  leading: const Icon(Icons.settings,
                    color: Colors.blue,),
                  onTap: () {
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(

                child: ListTile(
                  title: const Text('Share'),
                  leading: const Icon(Icons.share,
                    color: Colors.blue,),
                  onTap: () {

                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(

                child: ListTile(
                  title: const Text('About'),
                  leading: const Icon(Icons.help,
                    color: Colors.blue,),
                  onTap: () {

                  },
                ),
              ),
            ),

          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}


AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,

    title: Column(
      children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                //ImageIcon(AssetImage("assets/images/choreslogo.png"),color: Colors.blue, size: 80,),

                Text(
                  "Chores",
                  style: TextStyle(color: Colors.black),
                ),

            ],


    ),],
  ));

}