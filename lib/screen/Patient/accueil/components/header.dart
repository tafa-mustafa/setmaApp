import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:setma/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
    @required this.orientation,
  }) : super(key: key);

  final Size size;
  final orientation;

  @override
  Widget build(BuildContext context) {
    double taillePhoto = size.height * 0.15;
    double tailleLogo = size.height * 0.08;
    // double tailleTexteNom = size.height * 0.03;

    return Container(
      // margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.38,
      child: Stack(
        children: <Widget>[
          Container(
            //alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 16 + kDefaultPadding,
            ),
            height: size.height * 0.38 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(170),
                bottomRight: Radius.circular(170),
              ),
            ),
            child: SizedOverflowBox(
              size: new Size(size.width, size.height * 0.18 - 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo1.png",
                        height: tailleLogo,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tito GB',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        //textHeightBehavior: tailleTexteNom,
                      ),
                      if (orientation == Orientation.portrait)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(taillePhoto),
                          child: Image.asset(
                            "assets/images/moi.jpeg",
                            height: taillePhoto,
                          ),
                        ),
                      /*
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/moi.jpeg'),
                      radius: 70.0,
                    ),*/
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 54,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_left,
                      color: kPrimaryColor,
                    ),
                    Text(
                      '27 / 08',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Positioned(
                    left: 0,
                    child: Icon(
                      Icons.arrow_left,
                      color: kPrimaryColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Icon(
                      Icons.arrow_right,
                      color: kPrimaryColor,
                    ),
                  ),
*/
