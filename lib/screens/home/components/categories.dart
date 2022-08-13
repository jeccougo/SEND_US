import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import '../../robanstores/roban_screen.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.png", "text": "Elec tronics",  "route": RobanScreen.routeName, "colored": 0xffff7407},
      {"icon": "assets/icons/Automobile.png", "text": "Auto mobile", "route": RobanScreen.routeName, "colored": 0xffff7407},
      {"icon": "assets/icons/fashion.png", "text": "Fashion", "route": RobanScreen.routeName, "colored": 0xffff0716},
      {"icon": "assets/icons/Gift Icon.png", "text": "Daily Gift", "route": RobanScreen.routeName, "colored": 0xfffff007},
      {"icon": "assets/icons/Discover.png", "text": "Groceries", "route": RobanScreen.routeName, "colored": 0xff7407ff},
      {"icon": "assets/icons/Automobile.png", "text": "Tech", "route": RobanScreen.routeName, "colored": 0xff07ff74},
      {"icon": "assets/icons/Discover.png", "text": "Groceries", "route": RobanScreen.routeName, "colored": 0xff4c2202},
      {"icon": "assets/icons/fashion.png", "text": "Tech", "route": RobanScreen.routeName, "colored": 0xffff7407},

    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              colored: categories[index]["colored"],
              press: () => Navigator.pushNamed(context, categories[index]["route"] ),
            ),
          ),
        ),
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    this.colored,
    required this.icon,
    required this.text,
    required this.press,
    this.route,
  }) : super(key: key);

  final String? icon, text, route;
  final int? colored;
  final GestureTapCallback press;




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,

      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Container(

                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(55),
                decoration: BoxDecoration(
                  color: Color(colored!).withOpacity(0.20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(icon!),
              ),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
