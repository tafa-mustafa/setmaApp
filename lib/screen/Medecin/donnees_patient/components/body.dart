import 'package:flutter/material.dart';
import 'package:setma/models/Constant.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/background.dart';
import 'package:setma/constants.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/header.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/item_card.dart';
import 'package:setma/screen/components/rounded_button.dart';

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
            Container(
              height: orientation == Orientation.portrait
                  ? size.height * 0.23
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: kDefaultPadding, bottom: 10),
                child: Text(
                  'Des conseils',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: 'Message',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
            ),
            RoundedButton(
              text: "ENVOYER",
              press: () {},
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
