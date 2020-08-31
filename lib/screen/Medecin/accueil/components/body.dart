import 'package:flutter/material.dart';
import 'package:setma/screen/Medecin/accueil/components/background.dart';
import 'package:setma/constants.dart';
import 'package:setma/screen/Medecin/accueil/components/header_with_seachbox.dart';
import 'package:setma/screen/Medecin/donnees_patient/index.dart';

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
            HeaderWithSearchBox(size: size),
            /*
            SizedBox(
              height: size.height * 0.78,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => {},
                    child: Container(
                      //color: Colors.black12,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: (index % 3 == 0)
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    border: Border.all(
                                      width: 2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    // shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  )
                                : BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: index % 2 != 0
                                  ? AssetImage('assets/images/homme.jpg')
                                  : AssetImage('assets/images/femme.jpg'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          index % 2 == 0
                                              ? "Mme patiente $index "
                                              : "Mr patiente $index ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        index % 3 == 0
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                width: 7,
                                                height: 7,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              )
                                            : Container(
                                                child: null,
                                              ),
                                      ],
                                    ),
                                    Text(
                                      "12 : 44",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    index % 4 != 0
                                        ? "Derniere consultation 25/08/2020 "
                                        : "Temperature anormale : 41 °C",
                                    style: TextStyle(
                                      fontSize: 13,
                                      //color: Colors.black54,
                                      color: (index % 4 != 0)
                                          ? kPrimaryColor
                                          : Colors.red,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                //shrinkWrap: true,
              ),
            ),
            SizedBox(
              height: 10000,
              child: Text("OK"),
            ),
            */
            /*
            for (var i = 0; i < 100; i++)
              ListTile(
                leading: new CircleAvatar(
                  backgroundImage: i % 2 != 0
                      ? AssetImage('assets/images/homme.jpg')
                      : AssetImage('assets/images/femme.jpg'),
                  radius: 20.0,
                ),
                title: Text(
                    i % 2 == 0
                        ? "Mme Patient patiente $i "
                        : "Mr Patient patiente $i ",
                    style: TextStyle(
                      fontFamily: 'JoseFin',
                      fontSize: 17.0,
                    )),
                subtitle: Text(
                  i % 4 != 0
                      ? "Derniere consultation 25/08/2020 "
                      : "Temperature anormale : 41 °C",
                  style: TextStyle(
                    color: (i % 4 != 0) ? kPrimaryColor : Colors.red,
                  ),
                ),
                trailing: new Icon(
                  Icons.call,
                  color: kPrimaryColor,
                ),
                
              ),*/

            /*
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemCount: 20,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("Index $index")),
              ),
            )*/
            /*
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemCount: 100,
              itemBuilder: (context, i) => ListTile(
                leading: new CircleAvatar(
                  backgroundImage: i % 2 != 0
                      ? AssetImage('assets/images/homme.jpg')
                      : AssetImage('assets/images/femme.jpg'),
                  radius: 20.0,
                ),
                title: Text(
                    i % 2 == 0
                        ? "Mme Patient patiente $i "
                        : "Mr Patient patiente $i ",
                    style: TextStyle(
                      fontFamily: 'JoseFin',
                      fontSize: 17.0,
                    )),
                subtitle: Text(
                  i % 4 != 0
                      ? "Derniere consultation 25/08/2020 "
                      : "Temperature anormale : 41 °C",
                  style: TextStyle(
                    color: (i % 4 != 0) ? kPrimaryColor : Colors.red,
                  ),
                ),
                trailing: Icon(Icons.looks_one),
              ),
            ),*/
            for (var index = 1; index <= 20; index++)
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        //print("OK");
                        return DonneesPatient();
                      },
                    ),
                  ),
                },
                child: Container(
                  //color: Colors.black12,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: (index % 4 != 0)
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    border: Border.all(
                                      width: 2,
                                      color: kSecondColor,
                                    ),
                                    // shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  )
                                : BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.red,
                                    ),
                                    // shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                            /*BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),*/
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: index % 2 != 0
                                  ? AssetImage('assets/images/homme.jpg')
                                  : AssetImage('assets/images/femme.jpg'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            padding: EdgeInsets.only(left: 10, top: 8),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          index % 2 == 0
                                              ? "Mme patiente $index "
                                              : "Mr patiente $index ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        index % 3 != 0
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                width: 7,
                                                height: 7,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              )
                                            : Container(
                                                child: null,
                                              ),
                                      ],
                                    ),
                                    Text(
                                      "12 : 44",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    index % 4 != 0
                                        ? "Derniere consultation 25/08/2020 "
                                        : "Temperature anormale : 41 °C",
                                    style: TextStyle(
                                      fontSize: 13,
                                      //color: Colors.black54,
                                      color: (index % 4 != 0)
                                          ? kPrimaryColor
                                          : Colors.red,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                /*
                                Padding(
                                  padding: const EdgeInsets.only(top: 13.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 1,
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                          thickness: 1,
                          indent: orientation == Orientation.portrait
                              ? size.width * 0.25
                              : size.width * 0.12,
                          endIndent: orientation == Orientation.portrait
                              ? 10
                              : size.width * 0.22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
