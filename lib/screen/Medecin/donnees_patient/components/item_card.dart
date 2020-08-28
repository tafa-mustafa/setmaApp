import 'package:flutter/material.dart';
import 'package:setma/models/Constant.dart';

import 'package:setma/constants.dart';

class ItemCard extends StatelessWidget {
  final Constant constant;
  final Function press;
  final Size size;
  final orientation;
  const ItemCard({
    Key key,
    this.constant,
    this.size,
    this.orientation,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        child: Container(
            //height: size.height * 0.10,
            padding: orientation == Orientation.portrait
                ? EdgeInsets.only(
                    left: kDefaultPadding - 8,
                    right: kDefaultPadding - 8,
                    top: kDefaultPadding - 3,
                    bottom: kDefaultPadding - 3)
                : EdgeInsets.all(kDefaultPadding - 8),
            // For  demo we use fixed height  and width
            // Now we dont need them
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
              //color: constant.color,
              border: Border.all(
                width: 1,
                color: kPrimaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: "${constant.id}",
                  child: Image.asset(constant.image),
                ),
                SizedBox(
                  width: orientation == Orientation.portrait
                      ? size.width * 0.27
                      : size.width * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        constant.valeur + " " + constant.unite,
                        style: TextStyle(
                          color: constant.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      Text(
                        constant.title,
                        style: TextStyle(
                          color: constant.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
            /*Hero(
            tag: "${constant.id}",
            child: Image.asset(constant.image),
          ),*/
            ),
      ),
      /*
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              // products is out demo list
              constant.title,
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          Text(
            "\$${constant.valeur}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )*/
    );
  }
}
