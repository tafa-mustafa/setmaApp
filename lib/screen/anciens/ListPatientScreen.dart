import 'package:folding_cell/folding_cell/widget.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListPatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setma',
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
  // final _key = GlobalKey<SimpleFoldingCellState>();
  // final _key1 = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(109, 221, 208, 1),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return SimpleFoldingCell.create(
                frontWidget: _frontWidget(index),
                innerWidget: _innerWidget(index),
                onOpen: () => print("open"),
                onClose: () => print("close"),
                cellSize: Size(MediaQuery.of(context).size.width, 148.0),
                padding: EdgeInsets.all(16),
                borderRadius: 12.0,
              );
            },
          )),
    );
  }

  Widget _frontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Color.fromRGBO(109, 221, 208, 1),
          alignment: Alignment.center,
          child: Stack(children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  'cell $index',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Positioned(
              right: 5.0,
              bottom: 0,
              child: FlatButton(
                onPressed: () {
                  final _foldingCellState =
                      context.findAncestorStateOfType<SimpleFoldingCellState>();
                  _foldingCellState?.toggleFold();
                },
                child: Text(
                  "Detail",
                  style: TextStyle(
                    color: Color.fromRGBO(109, 221, 208, 1),
                  ),
                ),
                color: Colors.white,
              ),
            ),
          ]),
        );
      },
    );
  }

  Widget _innerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          color: Colors.white,
          // alignment: Alignment.center,text
          child: Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text('Folding Cell part 2',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
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
                          backgroundColor: Color.fromRGBO(109, 221, 208, 1),
                        ),
                      ),
                    ),
                    // trailing: (Icons.Iconarrow_forward, color: Colors.blue),
                    //   title: Row(children: <Widget>[
                    //     Text('prenom'),
                    //     SizedBox(
                    //       width: 10.0,
                    //     ),
                    //     Text('nom'),
                    //   ]),
                    //   subtitle: Row(children: <Widget>[
                    //     Icon(FontAwesomeIcons.temperatureHigh),
                    //     SizedBox(
                    //       width: 10.0,
                    //     ),
                    //     Icon(FontAwesomeIcons.heartbeat)
                    //   ]),

                    //   // When a user taps the ListTile, navigate to the DetailScreen.
                    //   // Notice that you're not only creating a DetailScreen, you're
                    //   // also passing the current todo through to it.
                    //   // onTap: () {
                    //   //   Navigator.push(
                    //   //     context,
                    //   //     MaterialPageRoute(
                    //   //       builder: (context) => DetailPatientScreen(),
                    //   //       // Pass the arguments as part of the RouteSettings. The
                    //   //       // DetailScreen reads the arguments from these settings.
                    //   //       settings: RouteSettings(
                    //   //         arguments: todos[index],
                    //   //       ),
                    //   //     ),
                  )),
                )),
            Positioned(
              right: 5.0,
              bottom: 0,
              child: FlatButton(
                onPressed: () {
                  final _foldingCellState =
                      context.findAncestorStateOfType<SimpleFoldingCellState>();
                  _foldingCellState?.toggleFold();
                },
                child: Text(
                  "close",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromRGBO(109, 221, 208, 1),
              ),
            ),
          ]),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Todo {
//   int id;
//   final String prenom;
//   final String nom;
//   final int temperature;
//   final int pression;

//   Todo(this.id, this.prenom, this.nom, this.temperature, this.pression);
// }

// class ListPatientScreen extends StatelessWidget {
//   final todos = List<Todo>.generate(
//     20,
//     (i) => Todo(i, 'prenom', 'nom', 37, 25),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(),
//       appBar: AppBar(
//         title: Text('Pick an option'),
//         backgroundColor: Color.fromRGBO(109, 221, 208, 1),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           return Container(
//             // color: Color.fromRGBO(51, 153, 255, 0),
//             child: ListTile(
//               leading: GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 48,
//                   height: 48,
//                   padding: EdgeInsets.symmetric(vertical: 4.0),
//                   alignment: Alignment.center,
//                   child: CircleAvatar(
//                     child: Icon(Icons.person),
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//               ),
//               trailing: Icon(Icons.arrow_forward, color: Colors.blue),
//               title: Row(children: <Widget>[
//                 Text(todos[index].prenom),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text(todos[index].nom),
//               ]),
//               subtitle: Row(children: <Widget>[
//                 Icon(FontAwesomeIcons.temperatureHigh),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Icon(FontAwesomeIcons.heartbeat)
//               ]),

//               // When a user taps the ListTile, navigate to the DetailScreen.
//               // Notice that you're not only creating a DetailScreen, you're
//               // also passing the current todo through to it.
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailPatientScreen(),
//                     // Pass the arguments as part of the RouteSettings. The
//                     // DetailScreen reads the arguments from these settings.
//                     settings: RouteSettings(
//                       arguments: todos[index],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
