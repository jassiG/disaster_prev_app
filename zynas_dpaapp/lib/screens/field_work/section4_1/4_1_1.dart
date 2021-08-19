import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/models/inventory_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:disaster_prevention/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Four11 extends StatefulWidget {
  final Box<InventoryImage> img;
  final Box<InventoryCoord> coord;
  const Four11(this.img, this.coord);
  @override
  _Four11State createState() => _Four11State();
}

class _Four11State extends State<Four11> {
  late File _image;
  late String linkImg;
  final picker = ImagePicker();
  int check = 0;
//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        linkImg = pickedFile.path;
        check = 1;
      }
    });
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        linkImg = pickedFile.path;
        check = 1;
      }
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
        title: Text('Create / Scan Map'),
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
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: _wd * 0.05,
            vertical: _total * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  "Scan image of the hand written sketch",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                height: _total * 0.1,
                width: _wd * 0.75,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: _total * 0.45,
                width: _wd * 0.9,
                child: check == 0
                    ? Icon(
                        Icons.camera_alt_outlined,
                        size: 100,
                      )
                    : _image == null
                        ? AutoSizeText(
                            'NOTE : No image selected Yet !!',
                            style: TextStyle(fontSize: 45),
                            maxLines: 2,
                          )
                        : Image.file(
                            _image,
                            fit: BoxFit.contain,
                          ),
              ),
              Container(
                // height: _total * 0.03,
                height: 10,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 25)),
                  Container(
                    // height: _total * 0.1,
                    // width: _wd * 0.2,
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ElevatedButton.icon(
                      // child: AutoSizeText(
                      //   'Import from Gallery',
                      //   style: TextStyle(fontSize: 16),
                      //   maxLines: 2,
                      // ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      label: Text(
                        //"Import from Gallery",
                        "Import\nFrom\nGallery",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      icon: Icon(
                        Icons.photo,
                        size: 70,
                      ),

                      onPressed: getImageFromGallery,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  // Container(
                  //   width: _wd * 0.05,
                  // ),
                  Container(
                    // height: _total * 0.03,
                    height: 20,
                  ),
                  Container(
                    // height: _total * 0.1,
                    // width: _wd * 0.2,
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      // child: AutoSizeText(
                      //   'Import from Camera',
                      //   style: TextStyle(fontSize: 16),
                      //   maxLines: 2,
                      // ),
                      label: Text(
                        "Import\nFrom\nCamera",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      icon: Icon(
                        Icons.camera_alt,
                        size: 70,
                      ),
                      onPressed: getImageFromCamera,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  Container(
                    // height: _total * 0.03,
                    height: 10,
                  ),
                  Container(
                    // height: _total * 0.1,
                    // width: _wd * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 300,
                    width: 200,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      label: Text(
                        'Save\nMap',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      icon: Icon(
                        Icons.save_alt,
                        size: 70,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.of(context).pop(true);
                            });
                            return AlertDialog(
                              title: check == 0
                                  ? Text("Please Choose an Image")
                                  : Text('Image Saved'),
                            );
                          },
                        );
                        if (check == 1) {
                          print(linkImg);

                          widget.img.add(
                            InventoryImage(
                              link: linkImg,
                              identify: DateTime.now().toString(),

                              ///change1
                            ),
                          );
                          // for (int i = 0; i < widget.img.length; i++) {
                          //   print(widget.img.getAt(i)!.link);
                          // }
                          // print(widget.img.length);
                          // saveMap(_image);
                        }
                      },
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
}
