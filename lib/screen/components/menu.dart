import 'package:flutter/material.dart';
import 'package:setma/constants.dart';
import 'package:setma/screen/Login/login_screen.dart';

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
            accountName: new Text('Prenom NON_DE_FAMILLE'),
            accountEmail: new Text('monadreeseemail@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: AssetImage('assets/images/moi.jpeg'),
              radius: 70.0,
            ),
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
          ),
        ],
      ),
    );
  }
}

class ElementMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  // final Function press;
  // final Color color, textColor;
  const ElementMenu({
    Key key,
    this.icon = Icons.ac_unit,
    this.text = "New page",
    // this.text,
    // this.press,
    // this.color = kPrimaryColor,
    // this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ListTile(
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
      },
    );
  }
}
