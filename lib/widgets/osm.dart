//
//
//import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
////import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:latlng/latlng.dart';
//
//Widget OSM(BuildContext context) {
//  return FlutterMap(
//    options: MapOptions(
//      center: Center(51.5, -0.09),
//      zoom: 13.0,
//    ),
//    layers: [
//      TileLayerOptions(
//        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//        subdomains: ['a', 'b', 'c']
//      ),
//      MarkerLayerOptions(
//        markers: [
//          Marker(
//            width: 80.0,
//            height: 80.0,
//            point: LatLng(51.5, -0.09),
//            builder: (ctx) =>
//            new Container(
//              child: new FlutterLogo(),
//            ),
//          ),
//        ],
//      ),
//    ],
//  );
//}