import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:setma/constants.dart';
import 'package:setma/screen/Login/login_screen.dart';
import 'package:setma/screen/Medecin/accueil/accueil.dart';
import 'package:setma/screen/Patient/accueil/index.dart';

class MenuMedecin extends StatelessWidget {
  // final String text;
  // final Function press;
  // final Color color, textColor;
  const MenuMedecin({
    Key key,
    // this.text,
    // this.press,
    // this.color = kPrimaryColor,
    // this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Rama AFULLO'),
            accountEmail: new Text('rafulo@google.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: AssetImage('assets/images/moi.jpeg'),
              radius: 70.0,
            ),
          ),
          new ElementMenu(
            text: "Tableau de bord",
            icon: Icons.home,
            onPress: () {
              //Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //print("OK");
                    return AccueiMedecin();
                  },
                ),
              );
            },
          ),
          new ElementMenu(
            text: "Mon compte",
            icon: Icons.person,
          ),
          new ElementMenu(
            text: "About Page",
            icon: Icons.code,
          ),
          new ElementMenu(
            text: "Deconnexion",
            icon: Icons.arrow_left,
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //print("OK");
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuPatient extends StatelessWidget {
  // final String text;
  // final Function press;
  // final Color color, textColor;
  const MenuPatient({
    Key key,
    // this.text,
    // this.press,
    // this.color = kPrimaryColor,
    // this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Moi Patient'),
            accountEmail: new Text('patientmalade@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: AssetImage('assets/images/homme.jpg'),
              radius: 70.0,
            ),
          ),
          new ElementMenu(
            text: "Tableau de bord",
            icon: Icons.home,
            onPress: () {
              //Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //print("OK");
                    return AccueilPatient();
                  },
                ),
              );
            },
          ),
          new ElementMenu(
            text: "Historique",
            icon: Icons.person,
          ),
          new ElementMenu(
            text: "Mon compte",
            icon: Icons.person,
          ),
          new ElementMenu(
            text: "About Page",
            icon: Icons.code,
          ),
          new ElementMenu(
            text: "Deconnexion",
            icon: Icons.arrow_left,
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //print("OK");
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ElementMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPress;
  // final Function press;
  // final Color color, textColor;
  const ElementMenu({
    Key key,
    this.icon = Icons.ac_unit,
    this.text = "New page",
    this.onPress = null,
    // this.text,
    // this.press,
    // this.color = kPrimaryColor,
    // this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: new Icon(
          this.icon,
          size: 25,
          color: kPrimaryColor,
        ),
        title: new Text(
          this.text,
          style: TextStyle(
            fontFamily: 'JoseFin',
            fontSize: 17.0,
          ),
        ),
        onTap: () {
          if (this.onPress != null) onPress();
          /*
          Navigator.of(context).pop();
          switch (text) {
            case 'Deconnexion':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //print("OK");
                    return LoginScreen();
                  },
                ),
              );
              break;
            default:
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) => null));
              break;
          }
          */
        },
      ),
    );
  }
}
