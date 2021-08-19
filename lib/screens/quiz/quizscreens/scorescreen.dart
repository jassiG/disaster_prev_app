import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  final int correct;
  final int total;

  const ScoreScreen(this.correct, this.total);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  int corr = 0;
  int ttl = 0;
  @override
  void initState(){
    super.initState();
    corr = widget.correct;
    ttl = widget.total;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score'),
        //automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: MyText(txt: 'Your Score Is:', sz: 28, isthick: true),
          ),
          Container(
            alignment: Alignment.center,
              width: double.infinity,
              child: MyText(
                  txt: '$corr' + '/' '$ttl',
                  sz: 24,
                  isthick: true),
          )
        ],
      ),
    );
  }

  Widget MyText({required String txt, required int sz, required bool isthick}) {
    String text = txt;
    int size = sz;
    bool isThick = isthick;
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: isThick ? FontWeight.w800 : FontWeight.w500,
          fontSize: size * 1.0,
          color: Colors.black87,
        ),
      ),
    );
  }
}
