import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/models/inventory_2_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:disaster_prevention/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '/utils/location_2_info.dart';

class Four3 extends StatefulWidget {
  final Box<InventoryImage> img;
  final Box<Inventory2Coord> coord2;

  const Four3(this.img, this.coord2);
  @override
  _Four3State createState() => _Four3State();
}

class _Four3State extends State<Four3> {
  late int imgIx;

  @override
  void initState() {
    imgIx = widget.img.isNotEmpty &&
            widget.coord2.isNotEmpty &&
            (widget.img.getAt(0)!.identify == widget.coord2.getAt(0)!.identify)
        ? 0
        : -1;
  }

  double startDXPoint = -1;
  double startDYPoint = -1;

  _onTapUp(TapUpDetails details, int imgIx) {
    // print("*****");
    this.startDXPoint = details.localPosition.dx.floorToDouble();
    this.startDYPoint = details.localPosition.dy.floorToDouble();
    // print("$startDXPoint $startDYPoint ${widget.coord2.length}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Location2Info(
          startDXPoint,
          startDYPoint,
          widget.img.getAt(imgIx),
          1,
          widget.coord2,
        ),
      ),
    ).then((value) => setState(() {
          print(widget.img.getAt(imgIx)!.identify);
        }));
  }

  int add = 0;

  addPoints() {
    setState(
      () {
        add = 1;
      },
    );
  }

  viewPoints() {
    setState(
      () {
        add = 0;
      },
    );
  }

  deletePoint() {
    setState(
      () {
        add = 2;
      },
    );
  }

  deleteCoordinate(int i) {
    setState(() {
      widget.coord2.deleteAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("widget.coord2.length");
    // print(widget.coord2.length);
    // for (int i = 0; i < widget.coord2.length; i++) {
    //   print(
    //       "*index->$i ${widget.coord2.getAt(i)!.identify} ${widget.coord2.getAt(i)!.x} ${widget.coord2.getAt(i)!.y} ${widget.coord2.getAt(i)!.content}");
    // }
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Make Disaster Prevention Map',
          style: TextStyle(fontSize: 18),
        ),
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
      body: Container(
        margin: EdgeInsets.only(
          top: _total * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgIx == -1
                ? Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    height: _total * 0.4,
                    child: Icon(Icons.camera_alt_outlined),
                  )
                : Stack(
                    children: [
                      add == 1
                          ? GestureDetector(
                              onTapUp: (TapUpDetails details) =>
                                  _onTapUp(details, imgIx),
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                alignment: Alignment.center,
                                height: _total * 0.4,
                                child: Image.file(
                                  File(widget.img.getAt(imgIx)!.link),
                                  height: _total * 0.4,
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
                              alignment: Alignment.center,
                              height: _total * 0.4,
                              child: Image.file(
                                File(widget.img.getAt(imgIx)!.link),
                                height: _total * 0.4,
                                fit: BoxFit.contain,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                      for (var i = 0; i < widget.coord2.length; i++)
                        if (widget.img.isNotEmpty &&
                            widget.coord2.isNotEmpty &&
                            (widget.img.getAt(imgIx)!.identify ==
                                widget.coord2.getAt(i)!.identify))
                          Container(
                            margin: EdgeInsets.only(
                              left: widget.coord2.getAt(i)!.x,
                              top: widget.coord2.getAt(i)!.y,
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
                                        builder: (context) => Location2Info(
                                          widget.coord2.getAt(i)!.x,
                                          widget.coord2.getAt(i)!.y,
                                          widget.img.getAt(imgIx),
                                          0,
                                          widget.coord2,
                                        ),
                                      ),
                                    ).then((_) => setState(() {}));
                                },
                              ),
                            ),
                          ),
                    ],
                  ),
            Container(
              height: _total * 0.1,
              width: _wd,
              alignment: Alignment.center,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Coordinates: ',
                      style: TextStyle(fontSize: 25),
                    ),
                    AutoSizeText(
                      'X  :  $startDXPoint   ',
                      style: TextStyle(fontSize: 25),
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      'Y  :  $startDYPoint',
                      style: TextStyle(fontSize: 25),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.img.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: _total * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.lightBlue,
                        ),
                      ),
                      width: _wd * 0.4,
                      child: IconButton(
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
                    );
                  },
                ),
              ),
            ),
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
              heroTag: "btn1",
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
              heroTag: "btn2",
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
          // Container(
          //   height: 75,
          //   width: 75,
          //   child: new FloatingActionButton(
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
        ],
      ),
    );
  }
}
