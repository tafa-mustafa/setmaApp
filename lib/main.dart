import 'package:flutter/material.dart';
import 'package:setma/screen/Login/login_screen.dart';
import 'package:setma/screen/Medecin/accueil/accueil.dart';
import 'package:setma/screen/Medecin/donnees_patient/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'setma'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(255, 255, 255, 255),
      /* appBar: AppBar(
        backgroundColor: Color.fromRGBO(109, 221, 208, 1),
        title: Text(widget.title),
      ),*/
      body: Center(
        child: LoginScreen(),
      ),
    );
  }
}
