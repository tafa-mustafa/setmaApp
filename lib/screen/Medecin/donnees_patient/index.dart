import 'package:flutter/material.dart';
import 'package:setma/screen/Medecin/donnees_patient/components/body.dart';
import 'package:setma/screen/components/menu.dart';
import 'package:setma/screen/components/appBar.dart';

class DonneesPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SETMA',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MedecinAppBar(),
        drawer: MenuMedecin(),
        body: Body(),
      ),
    );
  }
}
