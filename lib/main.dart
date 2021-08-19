import 'package:disaster_prevention/screens/field_work/section4.dart';
import 'package:disaster_prevention/models/inventory_coord.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:disaster_prevention/screens/login_screen.dart';
import 'package:disaster_prevention/utils/routes.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'models/inventory_2_coord.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/disaster_archive/archive.dart';
// import 'screens/fieldwork/section4_1/import_city_map.dart';
// import 'screens/fieldwork/section4_1/import_google_map.dart';
// import 'screens/fieldwork/section4_1/import_scan_map.dart';
// import 'screens/fieldwork/section4_1/section_four_one.dart';
// import 'screens/fieldwork/section4_2/memorandum.dart';
// import 'screens/fieldwork/section4_3/make_map.dart';
import 'screens/home_screen.dart';
import 'screens/knowledge/knowledge.dart';
import 'screens/presentation/presentation.dart';
import 'screens/quiz/quiz.dart';
//Knowledge SubTopics
import 'screens/knowledge/chapter-one/one-one.dart';
import 'screens/knowledge/chapter-one/one-two.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);

  Hive.registerAdapter<InventoryImage>(InventoryImageAdapter());
  Hive.registerAdapter<InventoryCoord>(InventoryCoordAdapter());
  Hive.registerAdapter<Inventory2Coord>(Inventory2CoordAdapter());

  await Future.wait([Hive.openBox<InventoryImage>('inventory')]);
  await Future.wait([Hive.openBox<InventoryCoord>('coord')]);
  await Future.wait([Hive.openBox<Inventory2Coord>('coord2')]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // home: Four(title: 'Flutter Demo Home Page'),
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.sectionfourRoute: (context) => Section4Page(),
        // MyRoutes.sectionfourOneRoute: (context) => SectionFourOnePage(),
        // MyRoutes.importScanMapRoute: (context) => ImportScanMapPage(),
        // MyRoutes.importCityMapRoute: (context) => ImportCityMapPage(),
        // MyRoutes.importGoogleMapRoute: (context) => ImportGoogleMap(),
        MyRoutes.disasterArchive: (context) => Archive(),
        MyRoutes.presentation: (context) => Presentation(),
        MyRoutes.preventionKnowledge: (context) => Knowledge(),
        MyRoutes.quiz: (context) => Quiz(),
        MyRoutes.knowledge_one_one: (context) => OneOne(),
        MyRoutes.knowledge_one_two: (context) => OneTwo()
        // MyRoutes.memorandum: (context) => Memorandum(),
        // MyRoutes.make_map: (context) => MakeMap(),
      },
    );
  }

  // @override
  // void dispose() {
  //   Hive.box('notes').compact();
  //   Hive.close();
  //   super.dispose();
  // }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final Box<InventoryImage> img = Hive.box('inventory');
//     final Box<InventoryCoord> coord = Hive.box('coord');
//     final Box<Inventory2Coord> coord2 = Hive.box('coord2');

//     final _ht = MediaQuery.of(context).size.height;
//     final _wd = MediaQuery.of(context).size.width;
//     final _topPadding = MediaQuery.of(context).padding.top;
//     final _total = _ht - _topPadding;
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.symmetric(
//           horizontal: _wd * 0.05,
//           vertical: _total * 0.05,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: _topPadding,
//               color: Colors.white,
//             ),
//             Container(
//               height: _total * 0.05,
//             ),
//             Container(
//               height: _total * 0.05,
//               width: _wd * 0.5,
//               margin: EdgeInsets.only(left: _wd * 0.25, right: _wd * 0.25),
//               child: FittedBox(
//                 child: AutoSizeText(
//                   "Field Work",
//                   style: TextStyle(
//                     fontSize: 50,
//                   ),
//                   textAlign: TextAlign.center,
//                   maxLines: 2,
//                 ),
//               ),
//             ),
//             Container(
//               height: _total * 0.05,
//             ),
//             Container(
//               height: _total * 0.05,
//             ),
//             SizedBox(
//               height: _total * 0.1,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Four1(img, coord),
//                     ),
//                   );
//                 },
//                 child: AutoSizeText(
//                   '4-1 Create your own Map',
//                   style: TextStyle(fontSize: 45),
//                   maxLines: 2,
//                 ),
//               ),
//             ),
//             Container(
//               height: _total * 0.05,
//               width: _wd * 0.75,
//               child: AutoSizeText(
//                 "The info regarding 4-1 ................................................................................",
//                 style: TextStyle(fontSize: 20),
//                 maxLines: 2,
//               ),
//             ),
//             SizedBox(
//               height: _total * 0.1,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Four2(img, coord),
//                     ),
//                   );
//                 },
//                 child: AutoSizeText(
//                   '4-2 Add what you hear and see',
//                   style: TextStyle(fontSize: 45),
//                   maxLines: 2,
//                 ),
//               ),
//             ),
//             Container(
//               height: _total * 0.05,
//               width: _wd * 0.75,
//               child: AutoSizeText(
//                 "The info regarding 4-2 ................................................................................",
//                 style: TextStyle(fontSize: 20),
//                 maxLines: 2,
//               ),
//             ),
//             SizedBox(
//               height: _total * 0.1,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Four3(img, coord2),
//                     ),
//                   );
//                 },
//                 child: FittedBox(
//                   child: AutoSizeText(
//                     '4-3 Disaster Prevention Map Making',
//                     style: TextStyle(fontSize: 45),
//                     maxLines: 2,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: _total * 0.05,
//               width: _wd * 0.75,
//               child: AutoSizeText(
//                 "The info regarding 4-3 ................................................................................",
//                 style: TextStyle(fontSize: 20),
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Container(
//         height: 75,
//         width: 75,
//         child: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.black,
//             size: 30,
//           ),
//           backgroundColor: Colors.white,
//         ),
//       ),
//     );
//   }
// }
