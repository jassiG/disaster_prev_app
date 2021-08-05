import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExternalMap extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    _ExternalMapState();
  }
}
class _ExternalMapState extends State<ExternalMap>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Import Externally'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('this is external map section')
        ]
      ),
    );
  }
}