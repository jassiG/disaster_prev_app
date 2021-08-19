import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/utils/routes.dart';
import '/utils/location_info.dart';
import 'package:disaster_prevention/models/inventory_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Four2 extends StatefulWidget {
  final Box<InventoryImage> img;
  final Box<InventoryCoord> coord;

  const Four2(this.img, this.coord);

  @override
  _Four2State createState() => _Four2State();
}

class _Four2State extends State<Four2> {
  late int imgIx;
  double viewerZoom = 1.0;

  @override
  void initState() {
    imgIx = widget.img.isNotEmpty &&
            widget.coord.isNotEmpty &&
            (widget.img.getAt(0)!.identify == widget.coord.getAt(0)!.identify)
        ? 0
        : -1;
  }

  double startDXPoint = -1;
  double startDYPoint = -1;

  // bool toggle = false;
  _setLoc(TapUpDetails details) {
    setState(() {
      this.startDXPoint = details.localPosition.dx.floorToDouble();
      this.startDYPoint = details.localPosition.dy.floorToDouble();
    });
  }

  _onTapUp(double startX, double startY, int imgIx) {
    // print("*****");
    // this.startDXPoint = details.localPosition.dx.floorToDouble();
    // this.startDYPoint = details.localPosition.dy.floorToDouble();
    // print("$startDXPoint $startDYPoint ${widget.coord.length}");
    // bool toggle = true;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationInfo(
          startX,
          startY,
          widget.img.getAt(imgIx),
          1,
          widget.coord,
        ),
      ),
    ).then((value) => setState(() {
          print("identify: ${widget.img.getAt(imgIx)!.identify}");
        }));
  }

  int add = 0;

  addPoints() {
    setState(
      () {
        startDYPoint = -1;
        startDXPoint = -1;
        add = 1;
      },
    );
  }

  viewPoints() {
    setState(
      () {
        startDYPoint = -1;
        startDXPoint = -1;
        add = 0;
      },
    );
  }

  deletePoint() {
    setState(
      () {
        startDYPoint = -1;
        startDXPoint = -1;
        add = 2;
      },
    );
  }

  deleteCoordinate(int i) {
    setState(() {
      widget.coord.deleteAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add what you see & hear'),
//        leading: IconButton(icon: Icon(Icons.chevron_left),onPressed: ()=>Navigator.pop(context),),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    MyRoutes.homeRoute,
                    // ignore: unrelated_type_equality_checks
                    (route) => route == MyRoutes.homeRoute);
              },
              icon: Icon(Icons.home))
        ],
      ),

      drawer: Drawer(
        child: Container(
          color: Colors.white70,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.img.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: _total * 0.2,
                      width: _wd * 0.25,
                      child: Card(
                        elevation: 1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          child:  IconButton(
                            icon: Image.file(
                              File(widget.img.getAt(index)!.link),
                              height: _total * 0.2,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {
                              setState(() {
                                imgIx = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                  ],
                );
              },
            ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: _total * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1, ),
//            Container(
//              child: Expanded(
//                child: ListView.builder(
//                  scrollDirection: Axis.vertical,
//                  shrinkWrap: true,
//                  itemCount: widget.img.length,
//                  itemBuilder: (context, index) {
//                    return Column(
//                      children: [
//                        Container(
//                          height: _total * 0.2,
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            border: Border.all(
//                              color: Colors.lightBlue,
//                            ),
//                          ),
//                          width: _wd * 0.4,
//                          child: IconButton(
//                            icon: Image.file(
//                              File(widget.img.getAt(index)!.link),
//                              height: _total * 0.2,
//                              fit: BoxFit.contain,
//                            ),
//                            onPressed: () {
//                              setState(() {
//                                imgIx = index;
//                              });
//                            },
//                          ),
//                        ),
//                        Divider(
//                          height: 10,
//                          color: Colors.transparent,
//                        ),
//                      ],
//                    );
//                  },
//                ),
//              ),
//            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            imgIx == -1
                ? Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: _wd * 0.95,
                    height: _ht * 0.85,
                    child: Icon(Icons.camera_alt_outlined),
                  )
                : InteractiveViewer(
                    //transformationController: tController,
                    child: Stack(
                      children: [
                        add == 1
                            ? GestureDetector(
                                onTapUp: (TapUpDetails details) => {
                                  _setLoc(details),
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: _wd * 0.95,
                                  height: _ht * 0.85,
                                  child: Image.file(
                                    File(widget.img.getAt(imgIx)!.link),
                                    width: _wd * 0.95,
                                    height: _ht * 0.85,
                                    fit: BoxFit.contain,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: _wd * 0.95,
                                height: _ht * 0.85,
                                child: Image.file(
                                  File(widget.img.getAt(imgIx)!.link),
                                  width: _wd * 0.95,
                                  height: _ht * 0.85,
                                  fit: BoxFit.contain,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                        startDYPoint == -1
                            ? Text("")
                            : Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: startDXPoint -
                                            20 / 2 +
                                            2, // +2 because Icon is asymmetric
                                        top:
                                            (startDYPoint - 40 - 20 / sqrt2 > 0)
                                                ? (startDYPoint - 20 * sqrt2)
                                                : (startDYPoint -
                                                    20 / 2 +
                                                    2 +
                                                    20 / sqrt2)),
                                    child: Transform.rotate(
                                      angle: pi / 4,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    height: 40,
                                    width: 116,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: startDXPoint -
                                            116 / 2 +
                                            4, // +4 because container is asymmetric
                                        top:
                                            (startDYPoint - 40 - 20 / sqrt2 > 0)
                                                ? (startDYPoint -
                                                    40 +
                                                    4 -
                                                    20 / sqrt2)
                                                : (startDYPoint -
                                                    20 / 2 +
                                                    4 +
                                                    20 / sqrt2)),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.camera),
                                        ),
                                        VerticalDivider(),
                                        IconButton(
                                          onPressed: () {
                                            _onTapUp(startDXPoint, startDYPoint,
                                                imgIx);
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        for (var i = 0; i < widget.coord.length; i++)
                          if (widget.img.isNotEmpty &&
                              widget.coord.isNotEmpty &&
                              (widget.img.getAt(imgIx)!.identify ==
                                  widget.coord.getAt(i)!.identify))
                            Container(
                              margin: EdgeInsets.only(
                                left: widget.coord.getAt(i)!.x,
                                top: widget.coord.getAt(i)!.y,
                              ),
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(20),
                                    primary: (add == 0)
                                        ? Colors.blue
                                        : (add == 1)
                                            ? Colors.green
                                            : Colors.red, // <-- Button color
                                    onPrimary: (add == 0)
                                        ? Colors.blue
                                        : (add == 1)
                                            ? Colors.green
                                            : Colors.red, // <-- Splash color
                                  ),
                                  child: Text("*"),
                                  onPressed: () {
                                    if (add == 2) deleteCoordinate(i);
                                    if (add < 2)
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LocationInfo(
                                            widget.coord.getAt(i)!.x,
                                            widget.coord.getAt(i)!.y,
                                            widget.img.getAt(imgIx),
                                            0,
                                            widget.coord,
                                          ),
                                        ),
                                      ).then(
                                        (_) => setState(() {}),
                                      );
                                  },
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
            Spacer(flex: 2, ),
            // Container(
            //   height: _total * 0.1,
            //   width: _wd,
            //   alignment: Alignment.center,
            //   child: Container(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         AutoSizeText(
            //           'Coordinates: ',
            //           style: TextStyle(fontSize: 25),
            //         ),
            //         AutoSizeText(
            //           'X  :  $startDXPoint   ',
            //           style: TextStyle(fontSize: 25),
            //           maxLines: 2,
            //         ),
            //         AutoSizeText(
            //           'Y  :  $startDYPoint',
            //           style: TextStyle(fontSize: 25),
            //           maxLines: 2,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            // Container(
            //   child: Expanded(
            //     child: ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       shrinkWrap: true,
            //       itemCount: widget.img.length,
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             Container(
            //               height: _total * 0.2,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 border: Border.all(
            //                   color: Colors.lightBlue,
            //                 ),
            //               ),
            //               width: _wd * 0.4,
            //               child: IconButton(
            //                 icon: Image.file(
            //                   File(widget.img.getAt(index)!.link),
            //                   height: _total * 0.2,
            //                   fit: BoxFit.contain,
            //                 ),
            //                 onPressed: () {
            //                   setState(() {
            //                     imgIx = index;
            //                   });
            //                 },
            //               ),
            //             ),
            //             Divider(height: 10),
            //           ],
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: 60,
            child: new FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                viewPoints();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 60,
            child: new FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onPressed: () {
                deletePoint();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 60,
            child: new FloatingActionButton(
              heroTag: "btn3",
              backgroundColor: Colors.green,
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                addPoints();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 60,
            child: new FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                  Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
