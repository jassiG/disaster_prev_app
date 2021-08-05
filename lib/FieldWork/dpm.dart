import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter/material.dart';
import '../widgets/imagebutton.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DPM extends StatefulWidget{
  @override
  _DPMState createState() => _DPMState();
}

class _DPMState extends State<DPM>{
  // These are some custom starting locations for the Google Map
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disaster Prevention Map'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Disaster Prevention Map\n',
                style: TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Here you can create and add different findings to your map.\n',
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
          // This is my Google Maps Widget, (figured out why it wass showing satelite pics)
          Container(
            width: 600,
            height: 600,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ElevatedButton(
                    child: Transform.scale(
                      scale: 2,
                      child: Icon(Icons.camera, color: Colors.white,),
                    ),
                    //child: Text('Click'),
                    //padding: EdgeInsets.all(10),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        //backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: Colors.red,
                                )
                            )
                        )
                    ),
                    onPressed: null,
                  ),
                ),
                SizedBox(width: 10, height: 1,),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ElevatedButton(
                    child: Transform.scale(
                      scale: 2,
                      child: Icon(Icons.text_fields, color: Colors.white,),
                    ),
                    //child: Text('Click'),
                    //padding: EdgeInsets.all(10),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        //backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: Colors.red,
                                )
                            )
                        )
                    ),
                    onPressed: null,
                  ),
                ),
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
Widget imagebutton = ImageButton(
    text: 'Pick Me',
    onClicked: null);