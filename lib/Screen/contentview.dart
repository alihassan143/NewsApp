import 'package:apibasedApp/Screen/urlpage.dart';
import 'package:flutter/material.dart';

import 'package:apibasedApp/Model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ContentView extends StatefulWidget {
  final Articles snapshot;
  const ContentView({
    Key key,
    this.snapshot,
  }) : super(key: key);

  @override
  _ContentViewState createState() => _ContentViewState(snapshot: snapshot);
}

class _ContentViewState extends State<ContentView> {
  final Articles snapshot;

  _ContentViewState({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'More Details',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Image(
                image: snapshot.urlToImage == null
                    ? AssetImage('assets/unnamed.jpeg')
                    : NetworkImage(snapshot.urlToImage),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                snapshot.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Description :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        snapshot.description,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      snapshot.author == null
                          ? Text(
                              'Author:${"Unknown"}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Author:${snapshot.author}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Source :${snapshot.source.name}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      timeAgo(
                        DateTime.parse(snapshot.publishedAt),
                      ),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewLoad(url:snapshot.url)));
                    },
                    child: Text('Read More'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String timeAgo(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
