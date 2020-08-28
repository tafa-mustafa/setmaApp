import 'package:flutter/material.dart';

class Constant {
  final String image, title, unite, valeur;
  final int id;
  final Color color;
  Constant({
    this.id,
    this.image,
    this.unite,
    this.valeur,
    this.title,
    this.color,
  });
}

List<Constant> constants = [
  Constant(
      id: 1,
      title: "Pulsation",
      valeur: "36.7",
      unite: "ppm",
      image: "assets/images/pulsation.png",
      color: Color(0xFF3d9b10)),
  Constant(
      id: 2,
      title: "Tension",
      valeur: "116-120",
      unite: "mmHg",
      image: "assets/images/tension.png",
      color: Color(0xFF0C3DBD)),
  Constant(
      id: 3,
      title: "Glycemie",
      valeur: "0.91",
      unite: "mg/dl",
      image: "assets/images/glycemie.png",
      color: Color(0xFF000000)),
  Constant(
      id: 4,
      title: "Taux Oxygene",
      valeur: "70",
      unite: "pp",
      image: "assets/images/oxygen.png",
      color: Color(0xFF3D82AE)),
];
/*
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
*/
