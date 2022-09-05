import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/CartModel.dart';
import '../../../models/Product.dart';

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
  late final Product product;
  late final int numOfItem;


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              CachedNetworkImage(
                  width: 70,
                  height: 70,
                  imageUrl: widget.cartModel!.productImageUrl.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
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

              TextButton(
                child: Text(widget.cartModel!.productName.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),),
                onPressed: () {},
              ),

              TextButton(
                child: Text(widget.cartModel!.productPrice.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
