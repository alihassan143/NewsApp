import 'package:apibasedApp/Network/netwrok.dart';
import 'package:flutter/material.dart';

import 'package:apibasedApp/Model/article.dart';
import 'package:apibasedApp/Screen/gridview.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<News> news;
  String search = 'news';

  @override
  void initState() {
    super.initState();
    news = getResult(search: search);

    // forcast.then((value) => print(value.list[0].));
  }

  Future<News> getResult({String search}) {
    search = search;
    news = new Network().getSearch(search: search);
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Search"),),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 35)),
          textFieldWidget(),
          Container(
            child: FutureBuilder<News>(
                future: news,
                builder: (context, AsyncSnapshot<News> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Flexible(
                                          child: GridViewPage(
                        snapshot: snapshot,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldWidget() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (value) {
          
          setState(() {
            
            search = value;
            news = new Network().getSearch(search: search);
          });
        },
      ),
    );
  }

  // ignore: missing_return

}
