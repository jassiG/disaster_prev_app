import 'package:flutter/material.dart';
import '../FieldWork/createmap.dart';
import '../FieldWork/memorandom.dart';
import '../FieldWork/dpm.dart';
import '../widgets/buttontext.dart';
import '../FieldWork/mymethod.dart';

class FieldWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Field Work'),),
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
                        text: 'FieldWork\n',
                        style: TextStyle(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Here you can create your maps and use them as Disaster Prevention Maps.\n',
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
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreateMap()),
                      );
                    },
                    child: Btntext('Create Map', 'Create a map by yourself or use external maps'),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 550.0,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Memorandom())
                    ),
                    child: Btntext('Memorandom' , 'Make a memoir of what you and your friends saw'),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 550.0,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>DPM())),
                    child: Btntext('Add Annotation','Make Disaster prevention map by adding annotations'),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 550.0,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>MyMethod())),
                    child: Btntext('My Method','Sandbox used by the dev to test things'),
                  ),
                ),
              ],
            ),
          ),
      //floatingActionButtonLocation: FloatingActionButtonLocation,
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