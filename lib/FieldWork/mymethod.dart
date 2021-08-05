import 'package:flutter/material.dart';

class MyMethod extends StatefulWidget{
  @override
  _MyMethodState createState() => _MyMethodState();
}
class _MyMethodState extends State<MyMethod>{
  Map<String, double> coords = {
    "x": 0,
    "y": 0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Method'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('This is This.'),
          ),
          SizedBox(
            width: 600,
            height: 600,
            child:Stack(
              children: [
                InteractiveViewer(
                  constrained: false,
                  child: Stack(
                    children: [
                      Image.asset('Assets/Mapbig.png'),
                      SizedBox(
                        width: 1747,
                        height: 865,
                        child: Align(
                          alignment: Alignment(coords["x"] , coords["y"]),
                          child: Image.asset('Assets/dot.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset('Assets/cross.png'),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.scale(
          scale: 1.5,
          child: Padding(
            padding: const EdgeInsets.only(right: 10,bottom: 10),
            child: FloatingActionButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back,color: Colors.white,),
            ),
          )
      ),
    );
  }
}