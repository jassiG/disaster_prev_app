import 'dart:async';
import 'dart:io';
import 'package:disasterprevapp/HiveStuff/mapimage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:disasterprevapp/widgets/imageList.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Memorandom extends StatefulWidget {
  @override
  _MemorandomState createState() => _MemorandomState();
}

class _MemorandomState extends State<Memorandom> {
  Box<MapImage> bx = Hive.box('MapImages');
  int _index = 1;
  bool isFile = false;
  bool deletemode = false;

  void _setDel(int index) {
    if (index == 1) {
      setState(() {
        deletemode = false;
        _index = index;
      });
    } else {
      setState(() {
        deletemode = true;
        _index = index;
      });
    }
  }

  void _delete(BuildContext context, img) {
    if (deletemode) {
      img.delete();
      setState(() {});
    }
  }

  MapImage chosen;
  BuildContext cntxt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memorandom'),
      ),
      body:
          Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: SizedBox(
                    width: 500,
                    height: 100,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Memorandom\n',
                        style: TextStyle(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Here you can see different Maps Created By You.\n',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 18.0,
                            ),
                          ),
                          deletemode
                              ? TextSpan(
                                  text: 'Long press any Tile to delete it.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 18.0,
                                  ),
                                )
                              : TextSpan(
                                  text: '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 18.0,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 400,
                      height: 400,
                      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: (chosen == null
                          ? Image.asset('Assets/noImage.jpg')
                          : Image.file(File(chosen.path))),
                    ),
                    SingleChildScrollView(
                        child: SizedBox(
                      width: 500,
                      height: 300,
                      child: ListView(
                        children: [
                          for (MapImage img in bx.values)
                            Slidable(
                              startActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (cntxt) => () {
                                      img.delete();
                                      setState(() {});
                                    },
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: null,
                                    backgroundColor: Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.file(File(img.path))),
                                title: img.name != null
                                    ? Text(img.name)
                                    : Text("Unnamed Map"),
                                onLongPress: () {
                                  if(deletemode)img.delete();
                                  setState(() {});
                                },
                                onTap: () {
                                  setState(() {
                                    chosen = img;
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              ToggleSwitch(
                  minWidth: 140.0,
                  initialLabelIndex: _index,
                  cornerRadius: 10.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['Delete Mode', 'Normal Mode'],
                  icons: [Icons.delete, Icons.image],
                  activeBgColors: [
                    [Colors.red],
                    [Colors.blue]
                  ],
                  onToggle: (index) {
                    _setDel(index);
                  }),
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
