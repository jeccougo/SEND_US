import 'package:flutter/material.dart';
import 'package:shop_app/screens/robanstores/roban_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOfferss extends StatelessWidget {
  const SpecialOfferss({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Featured Stores",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/download.png",
                category: "Roban Stores",
                numOfBrands: 1000,
                press: () => Navigator.pushNamed(context, RobanScreen.routeName),
              ),
              SpecialOfferCard(
                image: "assets/images/prt.jpg",
                category: "Gmart Stores",
                numOfBrands: 980,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/innoson.jpg",
                category: "Innoson",
                numOfBrands: 980,
                press: () {},
              ),SpecialOfferCard(
                image: "assets/images/kotec.jpg",
                category: "Kotec Stores",
                numOfBrands: 980,
                press: () {},
              ),

              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              width: 242,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),

              ),

            ),
            Container(
              width: 242,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],

                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover),
              ),
              //child: Image.asset(
              //  image,
             //   fit: BoxFit.cover,width: 242,
            //  ),

            ),



            Positioned(
                top: 120,
                left: 50,
                child: Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    borderRadius: BorderRadius.circular(20),

                      color: Colors.white.withOpacity(0.9)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15.0),
                      vertical: getProportionateScreenWidth(10),
                    ),

                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.black
                        ),
                        children: [
                          TextSpan(
                            text: "$category\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "$numOfBrands Products")
                        ],
                      ),
                    ),
                  ),
                )),






          ],
        ),
      ),
    );
  }
}
