import 'package:flutter/material.dart';
import 'package:setma/screen/DetailPatientScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Todo {
  int id;
  final String prenom;
  final String nom;
  final int temperature;
  final int pression;

  Todo(this.id, this.prenom, this.nom, this.temperature, this.pression);
}

class ListPatientScreen extends StatelessWidget {
  final todos = List<Todo>.generate(
    20,
    (i) => Todo(i, 'prenom', 'nom', 37, 25),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Pick an option'),
        backgroundColor: Color.fromRGBO(109, 221, 208, 1),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Container(
            // color: Color.fromRGBO(51, 153, 255, 0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.blue),
              title: Row(children: <Widget>[
                Text(todos[index].prenom),
                SizedBox(
                  width: 10.0,
                ),
                Text(todos[index].nom),
              ]),
              subtitle: Row(children: <Widget>[
                Icon(FontAwesomeIcons.temperatureHigh),
                SizedBox(
                  width: 10.0,
                ),
                Icon(FontAwesomeIcons.heartbeat)
              ]),

              // When a user taps the ListTile, navigate to the DetailScreen.
              // Notice that you're not only creating a DetailScreen, you're
              // also passing the current todo through to it.
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPatientScreen(),
                    // Pass the arguments as part of the RouteSettings. The
                    // DetailScreen reads the arguments from these settings.
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
