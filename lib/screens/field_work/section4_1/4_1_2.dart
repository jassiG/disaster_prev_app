import '/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Four12 extends StatefulWidget {
  @override
  _Four12State createState() => _Four12State();
}

class _Four12State extends State<Four12> {
  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
            //alignment: Alignment.center,
            //color: Colors.grey,
            child: InteractiveViewer(
              maxScale: 10.0,
              //clipBehavior: Clip.v,
              child: Image.asset(
                "assets/images/FullMap.jpg",
                fit: BoxFit.contain,
              ),
            ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
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
              backgroundColor: Colors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }
}
