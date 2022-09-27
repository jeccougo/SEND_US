import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../firebaseServices.dart';
import '../../../models/CartModel.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  Body(
  {Key? key,
    required this.cartModel,})
  : super(key: key);

  CartModel? cartModel;


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late  Product product;
  late final int numOfItem;
  final FirebaseServices firebaseServices = FirebaseServices();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                    child: CachedNetworkImage(
                        width: 70,
                        height: 70,
                        imageUrl: widget.cartModel!.productImageUrl.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/download.png",
                          width: 40,
                          height: 40,
                        ) //Icon(Icons.error),
                    ),

                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.cartModel!.productName.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,),
                  SizedBox(height: 5),
                  //Text(widget.cartModel!.productPrice.toString(),
                  //style: TextStyle(
                  //fontSize: 20,
                  // fontWeight: FontWeight.w700,
                  //color: Colors.black,
                  // ),),
                  Text.rich(
                    TextSpan(
                      text: "\$${widget.cartModel!.productPrice.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),

                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  firebaseServices.removeFromCart(context, widget.cartModel!);

                },
                child: Text('Remove'),
              )
            ],
          ),
        ],



      ),
    );
  }
}


