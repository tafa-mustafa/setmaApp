import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:folding_cell/folding_cell/widget.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListConsultation extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setmapp',
      theme: ThemeData(primaryColor: Color.fromRGBO(109, 221, 208, 1)),
      home: MyHomePage(title: ' Consultations'),
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
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];

  List<CircularStackEntry> circularData = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Color(0xff4285F4), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0xfff3af00), rankKey: 'Q2'),
        new CircularSegmentEntry(1800.0, Color(0xffec3337), rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Color(0xff40b24b), rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  Material myTextItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myCircularItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnimatedCircularChart(
                      size: const Size(100.0, 100.0),
                      initialChartData: circularData,
                      chartType: CircularChartType.Pie,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mychart1Items(String title, String priceVal, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data,
                      lineColor: Color(0xffff6101),
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Material mychart2Items(String title, String priceVal, String subtitle) {
  //   return Material(
  //     color: Colors.white,
  //     elevation: 14.0,
  //     borderRadius: BorderRadius.circular(24.0),
  //     shadowColor: Color(0x802196F3),
  //     child: Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(
  //                     title,
  //                     style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: Colors.blueAccent,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(
  //                     priceVal,
  //                     style: TextStyle(
  //                       fontSize: 30.0,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(
  //                     subtitle,
  //                     style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: Colors.blueGrey,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: new Sparkline(
  //                     data: data1,
  //                     fillMode: FillMode.below,
  //                     fillGradient: new LinearGradient(
  //                       begin: Alignment.topCenter,
  //                       end: Alignment.bottomCenter,
  //                       colors: [Colors.amber[800], Colors.amber[200]],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {
        //       //
        //     }),
        title: Text(widget.title),
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(FontAwesomeIcons.chartLine),
          //     onPressed: () {
          //       //
          //     }),
        ],
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mychart1Items(
                  "Constents by Month", "4218 c", "+12.9% of tension"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myCircularItems("Tension", "7.0"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: myTextItems("Glycemy. ght", "4.0"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: myTextItems("Presion", "25.5M"),
            ),
            Container(
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: mychart2Items("Conversion", "0.9M", "+19% of target"),
            // ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(4, 250.0),
          ],
        ),
      ),
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
