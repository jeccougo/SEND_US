import 'package:flutter/material.dart';
import 'package:shop_app/models/Robanstorelist.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class RobanCard extends StatelessWidget {
  const RobanCard({
    Key? key, required this.robanstorelist,
  }) : super(key: key);

  final Robanstorelist robanstorelist;

  get product => null;

  get numOfItem => null;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: Image.asset(robanstorelist.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              robanstorelist.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${robanstorelist.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${robanstorelist.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )

      ],

    );

  }
}


