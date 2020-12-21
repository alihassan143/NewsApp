import 'package:apibasedApp/Model/article.dart';
import 'package:apibasedApp/Network/netwrok.dart';
import 'package:apibasedApp/Screen/gridview.dart';
import 'package:flutter/material.dart';


class HotNews extends StatefulWidget {
  @override
  _HotNewsState createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {
  Future<News> news;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    news = new Network().gehottheadlines();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: news.asStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: GridViewPage(snapshot: snapshot,),
          );
        }
      },
    );
  }
}


