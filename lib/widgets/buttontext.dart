import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Btntext extends StatelessWidget{
  String maintext;
  String subtext;
  Btntext(this.maintext, this.subtext);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment(-1, 1),
            child: RichText(
              text: TextSpan(
                text: maintext,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Divider(color: Colors.white, endIndent: 100,),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment(-1,-1),
            child: RichText(
              text: TextSpan(
                text: subtext,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}