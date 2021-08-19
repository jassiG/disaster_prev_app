import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1-1 水害')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: '平成29年7月九州北部豪雨',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
