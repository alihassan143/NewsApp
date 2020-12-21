
import 'package:apibasedApp/Screen/hotnews.dart';
import 'package:apibasedApp/Screen/topchannels.dart';
import 'package:apibasedApp/Screen/viewofscreen.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
         backgroundColor: Colors.amber,
        title: Text('NewsApp 2.0',textAlign: TextAlign.center,),),
          body: ListView(
        children: <Widget>[

          MainViewOfScreenHeadline(),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 10),
            child: Text(
              "Top Channels",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
              ),
              TopChannelsNames(),
              Padding( padding: EdgeInsets.only(
              top: 10,
              left: 10),
            child: Text(
              "Hot News",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),

              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              HotNews()
            
        ],

      ),
    );
    
  }
}


