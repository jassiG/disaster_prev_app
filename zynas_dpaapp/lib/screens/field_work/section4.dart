import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:disaster_prevention/models/inventory_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:disaster_prevention/models/inventory_2_coord.dart';

import '/screens/field_work/section4_1/4_1.dart';
import '/screens/field_work/section4_2/4_2.dart';
import '/screens/field_work/section4_3/4_3.dart';

// import 'package:auto_size_text/auto_size_text.dart';

class Section4Page extends StatefulWidget {
  @override
  _Section4PageState createState() => _Section4PageState();
}

class _Section4PageState extends State<Section4Page> {
  @override
  Widget build(BuildContext context) {
    final Box<InventoryImage> img = Hive.box('inventory');
    final Box<InventoryCoord> coord = Hive.box('coord');
    final Box<Inventory2Coord> coord2 = Hive.box('coord2');

    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;

    return Scaffold(
      appBar: AppBar(
        title: Text("FieldWork"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 450,
                width: 500,
                child: Image.asset(
                  "assets/images/sec_4.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                child: Text(
                  "Field Work:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      child: Text(
                        "4-1. Create your own Map",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                      onPressed: () {
                        // Navigator.pushNamed(
                        //     context, MyRoutes.sectionfourOneRoute);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Four1(img, coord),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    ElevatedButton(
                      child: Text(
                        "4-2. Add what you hear and see",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                      // onPressed: () {
                      //   Navigator.pushNamed(context, MyRoutes.memorandum);
                      // },
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Four2(img, coord),
                          ),
                        );
                      },
                    ),
//                    SizedBox(
//                      height: 5.0,
//                    ),
//                    ElevatedButton(
//                      child: Text(
//                        "4-3. Disaster Prevention Map Making",
//                        style: TextStyle(
//                          fontSize: 18,
//                          color: Colors.white,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
//                      style: TextButton.styleFrom(minimumSize: Size(350, 50)),
//                      // onPressed: () {
//                      //   Navigator.pushNamed(context, MyRoutes.make_map);
//                      // },
//
//                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => Four3(img, coord2),
//                          ),
//                        );
//                      },
//                    ),
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
              //         height: _total * 0.05,
              //       ),
              //       Container(
              //         height: _total * 0.05,
              //         width: _wd * 0.5,
              //         margin: EdgeInsets.only(left: _wd * 0.25, right: _wd * 0.25),
              //         child: FittedBox(
              //           child: AutoSizeText(
              //             "Field Work",
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //             textAlign: TextAlign.center,
              //             maxLines: 2,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: _total * 0.05,
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
              //                 builder: (context) => Four1(img, coord),
              //               ),
              //             );
              //           },
              //           child: AutoSizeText(
              //             '4-1 Create your own Map',
              //             style: TextStyle(fontSize: 16),
              //             maxLines: 2,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       SizedBox(
              //         height: _total * 0.1,
              //         width: double.infinity,
              //         child: ElevatedButton(
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => Four2(img, coord),
              //               ),
              //             );
              //           },
              //           child: AutoSizeText(
              //             '4-2 Add what you hear and see',
              //             style: TextStyle(fontSize: 16),
              //             maxLines: 2,
              //           ),
              //         ),
              //       ),
              //       SizedBox(height: 20),
              //       SizedBox(
              //         height: _total * 0.1,
              //         width: double.infinity,
              //         child: ElevatedButton(
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => Four3(img, coord2),
              //               ),
              //             );
              //           },
              //           child: FittedBox(
              //             child: AutoSizeText(
              //               '4-3 Disaster Prevention Map Making',
              //               style: TextStyle(fontSize: 16),
              //               maxLines: 2,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
