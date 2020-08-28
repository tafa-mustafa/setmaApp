import 'package:flutter/material.dart';
import 'package:setma/models/Constant.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/background.dart';
import 'package:setma/constants.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/header.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Background(
      child: SingleChildScrollView(
        //  scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Header(
              size: size,
              orientation: orientation,
            ),
            SizedBox(
              height: 15,
            ),
            //Spacer(),
            // for (var i = 0; i < 45; i++) Text("OK"),
            SizedBox(
              height: orientation == Orientation.portrait
                  ? size.height * 0.28
                  : size.height * 0.18,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                    itemCount: constants.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                      mainAxisSpacing: kDefaultPadding - 10,
                      crossAxisSpacing: kDefaultPadding - 10,
                      childAspectRatio:
                          orientation == Orientation.portrait ? 2 : 3,
                      //: new Size(10, height)
                      //  childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                          constant: constants[index],
                          press: () => {},
                          size: size,
                          orientation: orientation,
                          // press: () => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => DetailsScreen(
                          //         product: products[index],
                          //       ),
                          //     )),
                        )),
              ),
            ),
            Container(
              height: 370,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
