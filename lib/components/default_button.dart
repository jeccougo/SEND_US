import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 300,
          height: 60,
          child: TextButton(
            style: TextButton.styleFrom(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              primary: Colors.white,
              backgroundColor: kPrimaryColor,
            ),
            onPressed: press as void Function()?,
            child: Text(
              text!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
