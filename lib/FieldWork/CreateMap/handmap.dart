import 'dart:io';
import 'package:disasterprevapp/HiveStuff/coord.dart';
import 'package:disasterprevapp/HiveStuff/mapimage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

//import 'HandMap/mapfromimage.dart';
//import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';

class HandMap extends StatefulWidget {
  @override
  _HandMapState createState() => _HandMapState();
}

class _HandMapState extends State<HandMap> {
  final snackBar = SnackBar(content: Text('Map Saved!'), duration: Duration(milliseconds: 700),);
  final snackBar2 = SnackBar(content: Text('Map is Already Saved.'), duration: Duration(milliseconds: 700),);
  String mapName;
  bool hasImage = false;
  String pth;
  Directory AppDir;
  final picker = ImagePicker();

//  _HandMapState(){
//    ()async{
//      AppDir = await getApplicationDocumentsDirectory();
//    };
//  }
  Future getImage_gallery() async {
    AppDir = await getApplicationDocumentsDirectory();
    print("Application Directory Path: " + AppDir.path);
    final temp = await picker.pickImage(source: ImageSource.gallery);
    File img = File(temp.path);
    File image = await img.copy(AppDir.path +
        "Map_" +
        DateTime.now().millisecondsSinceEpoch.toString());
    setState(() {
      if (image != null) {
        pth = image.path;
        hasImage = true;
      } else {
        print("no image");
        hasImage = false;
      }
    });
    Navigator.pop(context);
  }

  Future getImage_camera() async {
    AppDir = await getApplicationDocumentsDirectory();
    print("Application Directory Path: " + AppDir.path);
    final temp = await picker.pickImage(source: ImageSource.camera);
    File img = File(temp.path);
    File image = await img.copy(AppDir.path +
        "Map_" +
        DateTime.now().millisecondsSinceEpoch.toString());
    setState(() {
      if (image != null) {
        pth = image.path;
        hasImage = true;
      } else {
        print("no image");
        hasImage = false;
      }
    });
    Navigator.pop(context);
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Your Own Map')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: RichText(
                text: TextSpan(
                  text: 'Import Map\n',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Here you can import Maps from your internal storage.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 500,
                height: 500,
                child: pth != null
                    ? Image.file(File(pth))
                    : Image.asset('Assets/noImage.jpg'),
              ),
            ),
            SizedBox(
              width: 1,
              height: 20,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Map Name',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 70,
                  child: ElevatedButton(
                      child: Transform.scale(
                        scale: 2.5,
                        child: Text('Import'),
                      ),
                      //child: Text('Click'),
                      //padding: EdgeInsets.all(10),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('What source do you want to use?'),
                                actions: [
                                  TextButton(
                                    child: Text('Camera'),
                                    onPressed: () => getImage_camera(),
                                  ),
                                  TextButton(
                                    child: Text('Gallery'),
                                    onPressed: () => getImage_gallery(),
                                  )
                                ],
                              ))),
                ),
                SizedBox(width: 20, height: 1),
                SizedBox(
                  width: 140,
                  height: 70,
                  child: ElevatedButton(
                    child: Transform.scale(
                      scale: 2.5,
                      child: Text('Save'),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide()))),
                    onPressed: hasImage
//                      ? Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => MapFromImage(_img)))
                        ? () async {
                            mapName = myController.text;
                            if (hasImage && mapName != null && mapName != "") {
                              Box<MapImage> imageBox =
                                  await Hive.box('MapImages');
                              imageBox.add(MapImage(pth, Coord(0.00, 0.00),
                                  Coord(0.00, 0.00), myController.text));
//                            for (var value in imageBox.values) {
//                              print("Image Saved. Pathe of the Image is: " + value.path);
//                            }
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              print(
                                  "Image Saved. Pathe of the Image is: " + pth);
                              hasImage = false;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                              print(
                                  "No Image, Or Already Saved, OR name not provided.");
                            }
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
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
