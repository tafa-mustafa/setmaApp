import 'package:flutter/material.dart';
import 'package:setma/screen/ListPatientScreen.dart';

class DetailPatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(109, 221, 208, 1),    
        title: Text(todo.prenom),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.nom),
      ),
    );
  }
}
