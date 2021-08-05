import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.city.hita.oita.jp/soshiki/somubu/kikikanrishitu/kikikanri/anshin/bosai/Preparing_for_disaster/3317.html';
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class WebMap extends StatefulWidget {
  @override
  _WebMapState createState() => _WebMapState();
}

class _WebMapState extends State<WebMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impoert From Web'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(50, 50, 20, 10),
            child: RichText(
              text: TextSpan(
                text: 'Get Map From Web',
                style: TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Divider(color: Colors.black45, thickness: 1,endIndent: 50, indent: 50,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(60, 50, 60, 10),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                text: 'Get a map from the official Hita city Disaster Hazard Map archive. \nThe Hita City Disaster Hazard Map archive contains previous disasters, their location, and their info. For more information, head over to Hita City Website\n\n',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'You can visit the website using the button below.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 400.0,
            height: 100,
            child: ElevatedButton(
              child: RichText(
                text: TextSpan(
                  text: 'Go to Site',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: _launchURL,
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
