import 'package:apibasedApp/Model/article.dart';
import 'package:apibasedApp/Network/netwrok.dart';
import 'package:apibasedApp/Screen/gridview.dart';
import 'package:flutter/material.dart';

class Sports extends StatefulWidget {
  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  Future<News> news;
 final String sports='sports';

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    news = new Network().getSearch(search:sports);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sports'),
      ),
      body: StreamBuilder(
          stream: news.asStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: GridViewPage(
                  snapshot: snapshot,
                ),
              );
            }
          }),
    );
  }

}
