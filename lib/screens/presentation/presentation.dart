import 'package:flutter/material.dart';

class Presentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presentation"),
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
              height: 400,
              width: 500,
              child: Image.asset(
                "assets/images/ppt.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Presentation Here"),
          ],
        ),
      ),
    );
  }
}
