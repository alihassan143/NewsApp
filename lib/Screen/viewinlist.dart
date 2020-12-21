import 'package:apibasedApp/Screen/contentview.dart';
import 'package:flutter/material.dart';

import 'package:apibasedApp/Model/article.dart';

class ViewInList extends StatefulWidget {
  final AsyncSnapshot<News> snapshot;
  const ViewInList({
    this.snapshot,
  });

  @override
  _ViewInListState createState() => _ViewInListState(snapshot: snapshot);
}

class _ViewInListState extends State<ViewInList> {
  final AsyncSnapshot<News> snapshot;

  _ViewInListState({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:ListView.builder(
        itemCount: snapshot.data.articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ContentView(snapshot: snapshot.data.articles[index]))),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 2 / 5,
                    height: 130,
                    padding: EdgeInsets.only(left: 5, top: 10),
                    child: Expanded(
                      child: Text(
                        snapshot.data.articles[index].title,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1.4,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 2 / 5,
                    height: 130,
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: snapshot.data.articles[index].urlToImage == null
                        ? AssetImage('assets/unnamed.jpeg')
                        : FadeInImage.assetNetwork(
                            placeholder: 'assets/placeholder.jpeg',
                            image: snapshot.data.articles[index].urlToImage,
                            fit: BoxFit.fitHeight,
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 1 / 3,
                          ),
                  )
                ],
              ),
            ),
          );
        }
        )
    );
  }
}
