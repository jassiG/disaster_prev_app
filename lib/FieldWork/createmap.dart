import 'package:flutter/material.dart';
import 'CreateMap/handmap.dart';
import '../widgets/buttontext.dart';
import 'CreateMap/webmap.dart';

class CreateMap extends StatefulWidget{
  @override
  _CreateMapState createState() => _CreateMapState();
}
class _CreateMapState extends State<CreateMap>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Map'),),
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: 'Create Map\n',
                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Here you can create the maps or import them externally.\n',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 550.0,
              height: 100,
              child: ElevatedButton(
                child: Btntext('Import Your Own Map','Import your own map, it can be a drawing or image'),
                onPressed: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> HandMap())),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: 550.0,
              height: 100,
              child: ElevatedButton(
                child: Btntext('Get from Website','Get a map from the Hita city website'),
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => WebMap())),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: 550.0,
              height: 100,
              child: ElevatedButton(
                child: Btntext('Import Externally','Get your map from Open Street Maps'),
                onPressed: null,
              ),
            ),
          ],
        ),
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