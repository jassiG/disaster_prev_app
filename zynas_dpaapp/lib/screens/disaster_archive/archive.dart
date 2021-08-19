import 'package:flutter/material.dart';

class Archive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Archive"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            // Image.asset(
            //   "assets/images/presentation_image.png",
            //   fit: BoxFit.cover,
            // ),
            Container(
              height: 370,
              width: 500,
              child: Image.asset(
                "assets/images/archive.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Archive Here"),
          ],
        ),
      ),
    );
  }
}
