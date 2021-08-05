import 'dart:io';

import 'package:disasterprevapp/HiveStuff/mapimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:disasterprevapp/FieldWork/memorandom.dart';

Widget imageList(Box<MapImage> box){
  return ListView(
    children: [for( MapImage img in box.values )
          ListTile(
            leading: Image.file(File(img.path)),
            title: Text(img.path),
            onLongPress: () => (){
            }
          )
      ],
  );
}