import 'package:apibasedApp/Model/article.dart';
import 'package:apibasedApp/Network/netwrok.dart';
import 'package:apibasedApp/Screen/contentview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timeago/timeago.dart' as timeago;

class MainViewOfScreenHeadline extends StatefulWidget {
  @override
  _MainViewOfScreenHeadlineState createState() =>
      _MainViewOfScreenHeadlineState();
}

class _MainViewOfScreenHeadlineState extends State<MainViewOfScreenHeadline> {
  Future<News> news;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    news = new Network().getnews();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: news.asStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ViewOfScreen(
            snapshot: snapshot,
          );
        }
      },
    );
  }
}

class ViewOfScreen extends StatefulWidget {
  final AsyncSnapshot<News> snapshot;
  const ViewOfScreen({
    this.snapshot,
  });

  @override
  _ViewOfScreenState createState() => _ViewOfScreenState(snapshot: snapshot);
}

class _ViewOfScreenState extends State<ViewOfScreen> {
  final AsyncSnapshot<News> snapshot;
  _ViewOfScreenState({this.snapshot});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ContentView(snapshot:snapshot.data.articles[index])
                ));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 300,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: Stack(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: snapshot.data.articles[index].urlToImage ==
                                      null
                                  ? AssetImage('assets/images/unnamed.jpeg')
                                  : NetworkImage(snapshot
                                      .data.articles[index].urlToImage))),
                    ),
                    Positioned(
                        bottom: 30.0,
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          width: 250.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                snapshot.data.articles[index].title,
                                style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      bottom: 19,
                      left: 5,
                      child: snapshot.data.articles[index].source.name == null
                          ? Text("No source Avaialable")
                          : Text(
                              snapshot.data.articles[index].source.name,
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: snapshot.data.articles[index].publishedAt == null
                          ? Text('')
                          : Text(
                              timeAgo(DateTime.parse(
                                  snapshot.data.articles[index].publishedAt)),
                              style: TextStyle(color: Colors.black),
                            ),
                    )
                  ])));
        },
      ),
    );
  }

  String timeAgo(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
// Container(
//               padding:
//                   EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
//              child:Stack(
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)
//                      ),
//                    ),
//                    child:snapshot.data.articles[index].urlToImage==null?
//                    Image.asset('asstes/unnamed.jpeg'): Image(
//                      image: NetworkImage(snapshot.data.articles[index].urlToImage),
//                    ),
//                  ),
//                 //  Container(
//                 //    decoration: BoxDecoration(
//                 //      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 //      gradient: LinearGradient(begin: Alignment.bottomCenter,
//                 //      end: Alignment.topCenter,
//                 //      stops: [0.1,0.9]
//                 //      ,colors: [
//                 //        Colors.black.withOpacity(0.9),
//                 //        Colors.white.withOpacity(0.0)

//                 //      ]
//                 //      )
//                 //    ),
//                 //  ),
//                  Positioned(
//                    bottom: 30.0,
//                    child: Container(
//                      padding: EdgeInsets.only(left: 10.0,right: 10.0),
//                      width: 250.0,
//                      child: Column(
//                        children: <Widget>[
//                          Text(
//                            snapshot.data.articles[index].title,
//                            style: TextStyle(
//                              height: 1.5,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 12.0
//                            ),

//                          ),
//                          Positioned(
//                            top: 10.0,
//                            bottom: 10.0,
//                            child: Text(snapshot.data.articles[index].source.name,
//                            style:TextStyle(color: Colors.white70,
//                            fontSize: 9.0),
//                          ),
//                          ),
//                          Positioned(
//                            top: 10,
//                            bottom: 10,
//                            child: Text(timeAgo(DateTime.parse(snapshot.data.articles[index].publishedAt)
//                            )
//                            )
//                          )
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              )
//             )
