import 'package:flutter/material.dart';
import 'Homepage/fieldwork.dart';
import 'widgets/navigationdrawer.dart';
import 'widgets/buttontext.dart';


class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(title: Text('Zynas DPA')),
      body: Column(
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
                  text: 'Home\n',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      'Here you can see some disabled and enabled options\n',
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
            height: 10,
          ),
          SizedBox(
            width: 550.0,
            height: 100,
            child: ElevatedButton(
                onPressed: null,
                child: Btntext('Learn',
                    'Learn about different disaster prevention skills')),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 550.0,
            height: 100,
            child: ElevatedButton(
                onPressed: null,
                child:
                Btntext('Quiz', 'Test your disaster prevention knowledge')),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 550.0,
            height: 100,
            child: ElevatedButton(
                onPressed: null,
                child: Btntext(
                    'Disaster Archive', 'Learn about historical disasters')),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 550.0,
            height: 100,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FieldWork()));
                },
                child: Btntext('Field Work', 'Add and edit maps to make a disaster database')),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 550.0,
            height: 100,
            child: ElevatedButton(
              onPressed: null,
              child: Btntext('Presentation', 'Add presentations'),
            ),
          ),
        ],
      ),
    );
  }
}
