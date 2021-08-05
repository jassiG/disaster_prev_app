import 'package:disasterprevapp/HiveStuff/coord.dart';
import 'package:disasterprevapp/HiveStuff/mapimage.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Hive.init((await getApplicationDocumentsDirectory()).path);
  final dir = await getApplicationDocumentsDirectory();
  print(dir.path);
  //await Hive.initFlutter();
  Hive.init(dir.path);
  Hive.registerAdapter(CoordAdapter());
  Hive.registerAdapter(MapImageAdapter());
  //await Hive.openBox<Coord>('Coords');
  await Hive.openBox<MapImage>('MapImages');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //Hive Functions
//  Box imageBox;
  //@override
  //void initState() {
    //openBox();
  //}

//  Future openBox() async {
//    imageBox = await Hive.openBox('imageBox');
//    return;
//  }
//
//  void putImage(int key, String path) {
//    imageBox.put(key, path);
//    //imageBox.add('value');
//  }
//
//  void getImage(int key) {
//    print(imageBox.get(key));
//  }
//
//  void updateImages(int key, String path) {
//    imageBox.put(key, path);
//  }
//
//  void deleteImage(int key) {
//    imageBox.delete(key);
//  }
//
//  void getAll() {
//    print(imageBox.toMap());
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zynas DPA',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}
