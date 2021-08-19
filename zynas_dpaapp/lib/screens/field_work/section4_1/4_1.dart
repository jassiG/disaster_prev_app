// import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/models/inventory_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '4_1_1.dart';
import '4_1_2.dart';
import '4_1_3.dart';

class Four1 extends StatefulWidget {
  final Box<InventoryImage> img;
  final Box<InventoryCoord> coord;
  const Four1(this.img, this.coord);

  @override
  _Four1State createState() => _Four1State();
}

class _Four1State extends State<Four1> {
  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create your own map"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                child: Text(
                  "Here you can create own maps: ",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "4-1-1. Create your own map",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(300, 45)),
                    // onPressed: () {
                    //   Navigator.pushNamed(context, MyRoutes.importScanMapRoute);
                    // },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Four11(widget.img, widget.coord),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    child: Text(
                        "Write by hand / scan with camera (the completed for of the original map)"),
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: Text(
                      "4-1-2. Use the city map",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(300, 45)),
                    // onPressed: () {
                    //   Navigator.pushNamed(context, MyRoutes.importCityMapRoute);
                    // },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Four12(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    child: Text(
                        "Use the existing city maps (Hazard maps in our case)"),
                    height: 30.0,
                  ),
                  ElevatedButton(
                    child: Text(
                      "4-1-3. Import a map from google",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(300, 45)),
                    // onPressed: () {
                    //   Navigator.pushNamed(
                    //       context, MyRoutes.importGoogleMapRoute);
                    // },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Four13(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    child: Text(
                      "A map from google to set markers",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // body: Container(
      //   margin: EdgeInsets.symmetric(
      //     horizontal: _wd * 0.05,
      //     vertical: _total * 0.05,
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: _topPadding,
      //         color: Colors.white,
      //       ),
      //       Container(
      //         height: _total * 0.1,
      //         color: Colors.white,
      //       ),
      //       Container(
      //         height: _total * 0.10,
      //         width: _wd * 0.75,
      //         child: Text(
      //           "Create your own map",
      //           style: TextStyle(fontSize: 35),
      //         ),
      //       ),
      //       SizedBox(
      //         height: _total * 0.1,
      //         width: double.infinity,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => Four11(widget.img, widget.coord),
      //               ),
      //             );
      //           },
      //           child: AutoSizeText(
      //             '4-1-1 Create your own map',
      //             style: TextStyle(fontSize: 45),
      //             maxLines: 2,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: _total * 0.05,
      //         width: _wd * 0.75,
      //         child: AutoSizeText(
      //           "Write by hand / scan with camera (the completed for of the original map)",
      //           style: TextStyle(fontSize: 20),
      //           maxLines: 2,
      //         ),
      //       ),
      //       Container(
      //         height: _total * 0.05,
      //       ),
      //       SizedBox(
      //         height: _total * 0.1,
      //         width: double.infinity,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => Four12(),
      //               ),
      //             );
      //           },
      //           child: AutoSizeText(
      //             '4-1-2 Use the city map',
      //             style: TextStyle(fontSize: 45),
      //             maxLines: 2,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: _total * 0.05,
      //         width: _wd * 0.75,
      //         child: AutoSizeText(
      //           "Use the existing city maps (Hazard maps in our case)",
      //           style: TextStyle(fontSize: 20),
      //           maxLines: 2,
      //         ),
      //       ),
      //       Container(
      //         height: _total * 0.05,
      //       ),
      //       SizedBox(
      //         height: _total * 0.1,
      //         width: double.infinity,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => Four13(),
      //               ),
      //             );
      //           },
      //           child: AutoSizeText(
      //             '4-1-3 Import a map from google',
      //             style: TextStyle(fontSize: 45),
      //             maxLines: 2,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: _total * 0.05,
      //         width: _wd * 0.75,
      //         child: AutoSizeText(
      //           "A map from google to set markers",
      //           style: TextStyle(fontSize: 20),
      //           maxLines: 2,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: Container(
      //   height: 75,
      //   width: 75,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios_new,
      //       color: Colors.black,
      //       size: 30,
      //     ),
      //     backgroundColor: Colors.white,
      //   ),
      // ),
    );
  }
}
