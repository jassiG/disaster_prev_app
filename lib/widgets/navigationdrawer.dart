import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavigationDrawer extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigo,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            SizedBox(height: 150 , ),

            buildMenuItem('Profile', Icons.account_circle,),
            Divider(color: Colors.white,indent: 10,endIndent: 20,),
            buildMenuItem('Settings', Icons.settings,),
            Divider(color: Colors.white,indent: 10,endIndent: 20,),
            buildMenuItem('About', Icons.info),
            Divider(color: Colors.white,indent: 10,endIndent: 20,),
            buildMenuItem('Help', Icons.help),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem(String txt, IconData icon){
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(txt, style: TextStyle(color: color),),
    );
  }
}
