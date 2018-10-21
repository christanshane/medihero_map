import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/figure_joint_type.dart';
import 'package:map_view/polygon.dart';

var myKey = 'AIzaSyBTyvSaP3BX-bTTCYfi0ZOmsZHDg5cNDos';

void main() {
  MapView.setApiKey(myKey);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapView mapView = new MapView();

  List<Marker> markers = <Marker>[
    new Marker("1", "Great", 10.673238, 122.958496,
        color: Colors.red, draggable: true)
  ];

  List<Polygon> polygons = <Polygon>[
    new Polygon(
        "Nice one",
        <Location>[
          new Location(10.674165, 122.958440),
          new Location(10.672785, 122.957616),
          new Location(10.672334, 122.960160),
          new Location(10.674083, 122.960898),
        ],
        jointType: FigureJointType.round,
        strokeColor: Colors.blue,
        strokeWidth: 10.0,
        fillColor: Colors.blue.withOpacity(0.1))
  ];

  displayMap() {
    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      initialCameraPosition:
          new CameraPosition(new Location(10.673238, 122.958496), 15.0),
      showUserLocation: true,
      title: 'Google Map',
    ));
    mapView.onMapTapped.listen((tapped){
      mapView.setMarkers(markers);
      mapView.setPolygons(polygons);
      mapView.zoomToFit(padding: 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Google Map")),
      body: new Center(
        child: Container(
          child: RaisedButton(
            child: Text('Tap Me'),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 7.0,
            onPressed: displayMap,
          ),
        ),
      ),
    );
  }
}
