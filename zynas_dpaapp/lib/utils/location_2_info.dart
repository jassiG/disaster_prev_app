import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/models/inventory_2_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

// import 'models/inventory_2_coord.dart';

class Location2Info extends StatefulWidget {
  final double x;
  final double y;
  final InventoryImage? img;
  final int checkAdd;
  final Box<Inventory2Coord>? coord2;
  Location2Info(
    this.x,
    this.y,
    this.img,
    this.checkAdd,
    this.coord2,
  );

  @override
  _Location2InfoState createState() => _Location2InfoState();
}

class _Location2InfoState extends State<Location2Info> {
  var _witnessTextField = TextEditingController();
  var _contentTextField = TextEditingController();
  int date = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  int classification = -1;
  String linkImg = "";
  int i = 0;

  int checkExists(int i) {
    // print("index $i");
    // print("${widget.img?.identify} ${widget.coord2?.getAt(i)?.identify}");
    // print("${widget.x} ${widget.coord2?.getAt(i)?.x}");
    // print("${widget.y} ${widget.coord2?.getAt(i)?.y}");
    for (; i < widget.coord2!.length; i++) {
      if (widget.img?.identify == widget.coord2?.getAt(i)?.identify &&
          widget.img?.link == widget.coord2?.getAt(i)?.link &&
          widget.x == widget.coord2?.getAt(i)?.x &&
          widget.y == widget.coord2?.getAt(i)?.y) break;
    }
    // print("over ${widget.coord2!.length}");
    return i; //leave;
  }

  void initState() {
    if (widget.checkAdd == 0) {
      i = checkExists(i);
      // print("* $i");
      date = widget.coord2!.getAt(i)!.day;
      month = widget.coord2!.getAt(i)!.month;
      year = widget.coord2!.getAt(i)!.year;
      classification = widget.coord2!.getAt(i)!.classification;
      linkImg = widget.coord2!.getAt(i)!.image;

      _witnessTextField =
          TextEditingController(text: widget.coord2!.getAt(i)!.witness);
      _contentTextField =
          TextEditingController(text: widget.coord2!.getAt(i)!.content);
    }
  }

  void _displayDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      setState(
        () {
          date = value.day;
          month = value.month;
          year = value.year;
        },
      );
    });
  }

  void submitData(BuildContext context) {
    if (widget.checkAdd == 0) {
      if (_witnessTextField.text.isEmpty ||
          _contentTextField.text.isEmpty ||
          classification == -1) return;

      widget.coord2?.putAt(
        i,
        Inventory2Coord(
          link: widget.img!.link,
          x: widget.x,
          y: widget.y,
          classification: classification,
          content: _contentTextField.text.toString(),
          day: date,
          month: month,
          year: year,
          image: linkImg,
          witness: _witnessTextField.text.toString(),
          identify: widget.img!.identify,
          //change1
        ),
      );
    } else {
      // print("*case1");
      if (_witnessTextField.text.isEmpty ||
          _contentTextField.text.isEmpty ||
          classification == -1) return;
      // print("*case2");
      widget.coord2?.add(
        Inventory2Coord(
          link: widget.img!.link,
          x: widget.x,
          y: widget.y,
          classification: classification,
          content: _contentTextField.text.toString(),
          day: date,
          month: month,
          year: year,
          image: linkImg,
          witness: _witnessTextField.text.toString(),
          identify: widget.img!.identify,
          //new change2
        ),
      );
    }
    Navigator.pop(context);
  }

  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        linkImg = pickedFile.path;
      }
    });
  }

  void classChoose(int a) {
    setState(() {
      classification = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: _wd * 0.05,
          vertical: _total * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _total * 0.1,
              child: Row(
                children: [
                  Container(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () {
                        _displayDatePicker(context);
                      },
                      child: AutoSizeText(
                        "Choose Date",
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Container(
                    height: _total * 0.1,
                    width: _wd * 0.1,
                  ),
                  if (date != -1)
                    Container(
                      height: _total * 0.2,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "$date / $month / $year",
                        style: TextStyle(fontSize: 20),
                        maxLines: 2,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              height: _total * 0.1,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "WITNESS NAME",
                ),
                controller: _witnessTextField,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Times New Roman",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: _total * 0.35,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: _contentTextField,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter Content',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Times New Roman",
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Choose Classification: ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: (classification == -1)
                          ? Colors.lightBlue
                          : (classification != 0)
                              ? Colors.lightBlue
                              : Colors.green,
                      onPressed: () {
                        classChoose(0);
                      },
                      child: AutoSizeText(
                        "EARTHQUAKE",
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: (classification == -1)
                          ? Colors.lightBlue
                          : (classification != 1)
                              ? Colors.lightBlue
                              : Colors.green,
                      onPressed: () {
                        classChoose(1);
                      },
                      child: AutoSizeText(
                        "SAND AND WATER",
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: (classification == -1)
                          ? Colors.lightBlue
                          : (classification != 2)
                              ? Colors.lightBlue
                              : Colors.green,
                      onPressed: () {
                        classChoose(2);
                      },
                      child: AutoSizeText(
                        "EARTH AND SAND",
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () async {
                      await getImageFromGallery();
                    },
                    child: AutoSizeText(
                      "Choose Image",
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: _wd * 0.2,
                ),
              ],
            ),
            if (linkImg != "")
              Container(
                height: _total * 0.2,
                child: Image.file(
                  File(linkImg),
                  fit: BoxFit.contain,
                ),
              )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.done,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 60,
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 30,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
