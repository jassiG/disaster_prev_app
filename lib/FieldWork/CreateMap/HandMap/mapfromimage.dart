import 'dart:async';
import 'dart:io';

import 'package:disasterprevapp/HiveStuff/coord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:disasterprevapp/HiveStuff/mapimage.dart';

class MapFromImage extends StatefulWidget {
  final File image;

  MapFromImage(this.image);

  @override
  _MapFromImageState createState() => _MapFromImageState(image);
}

class _MapFromImageState extends State<MapFromImage> {
  File image;
  double mapOpacity = 0.5;
  double zoom = 17.0;
  int mapid;
  Completer<GoogleMapController> _controller = Completer();

  //MapController ctrl = new MapController();
  void increaseOp() {
    setState(() {
      mapOpacity = mapOpacity + 0.1;
      if (mapOpacity > 1) {
        mapOpacity = 1;
      }
    });
    print("opacity: $mapOpacity");
  }

  void decreaseOp() {
    setState(() {
      mapOpacity = mapOpacity - 0.1;
      if (mapOpacity < 0) {
        mapOpacity = 0;
      }
    });
    print("opacity: $mapOpacity");
  }

  static final CameraPosition _hitaHall = CameraPosition(
    target: LatLng(33.3212743726411, 130.9412553376933),
    zoom: 17,
  );

  void getMapData(GoogleMapController ctrl) async {
    zoom = await ctrl.getZoomLevel();
    LatLngBounds bounds = await ctrl.getVisibleRegion();
    print(bounds.southwest);
    print(bounds.northeast);
  }

  _MapFromImageState(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create the Map'),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.white,
            height: 50,
          ),
          SizedBox(
            width: 600,
            height: 600,
            child: Stack(
              children: [
                Center(
                  child: Image.file(image),
                ),
                Opacity(
                  opacity: mapOpacity,
                  child: Container(
                    width: 600,
                    height: 600,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _hitaHall,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        mapid = controller.mapId;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Map Opacity:',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
                height: 1,
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  child: Transform.scale(scale: 2, child: Icon(Icons.add)),
                  onPressed: increaseOp,
                ),
              ),
              SizedBox(
                width: 10,
                height: 1,
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  child: Transform.scale(scale: 2, child: Icon(Icons.remove)),
                  onPressed: decreaseOp,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            width: 100,
            height: 60,
            child: ElevatedButton(
              child: Transform.scale(scale: 2, child: Text('Create')),
              onPressed: () async {
                Box<MapImage> imageBox =
                    await Hive.openBox<MapImage>('MapImages');
                imageBox.add(
                    MapImage(image.path, Coord(0.00, 0.00), Coord(0.00, 0.00), 'Yolo!'));
                for (var value in imageBox.values) {
                  print(value.path);
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.scale(
          scale: 1.5,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
