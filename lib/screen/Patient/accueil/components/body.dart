import 'package:flutter/material.dart';
import 'package:setma/models/Constant.dart';
import 'package:setma/models/user_model.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/background.dart';
import 'package:setma/constants.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/header.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/item_card.dart';
import 'package:setma/screen/Patient/discussion/chat_screen.dart';
import 'package:setma/screen/components/rounded_button.dart';

class Body extends StatelessWidget {
  var texteButtons = ["Envoyer", "Alerter", "historique", "Discuter"];
  var iconesButtons = [
    Icons.send,
    Icons.add_alert,
    Icons.watch_later,
    Icons.message
  ];
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
              height: 45,
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
            SizedBox(
              height: 20,
            ),
            Container(
              height: orientation == Orientation.portrait
                  ? size.height * 0.23
                  : size.height * 0.42,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding - 10,
                    crossAxisSpacing: kDefaultPadding - 10,
                    childAspectRatio:
                        orientation == Orientation.portrait ? 3 : 6,
                    //: new Size(10, height)
                    //  childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton.icon(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        icon: Icon(iconesButtons[index]),
                        label: Text(texteButtons[index]),
                        onPressed: () => {
                          if (index == 3)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    //print("OK");
                                    return ChatScreen(
                                      user: doctor,
                                    );
                                  },
                                ),
                              ),
                            }
                        },
                      )),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
