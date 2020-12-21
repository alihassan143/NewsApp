import 'package:apibasedApp/Screen/contentview.dart';
import 'package:flutter/cupertino.dart';

import 'package:apibasedApp/Model/article.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart'as timeago;
class GridViewPage extends StatelessWidget {
  final AsyncSnapshot<News> snapshot;
  const GridViewPage({
    Key key,
    this.snapshot,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return  Container(
        
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height,maxWidth: MediaQuery.of(context).size.width),
                child: GridView.builder(
                         gridDelegate:
                  new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentView(snapshot: snapshot.data.articles[index],)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                   
                     padding: EdgeInsets.only(
                           
                            right: 10,left: 10),
                         
                            
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[100],
                          blurRadius: 5.0,
                          spreadRadius:1.0,
                          offset: Offset(1.0,1.0),
                        )

                      ]
                    ),
                    child: Column(
                      children: [
                        AspectRatio(aspectRatio: 16/9,

                        child: Container(
                         
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: snapshot.data.articles[index].urlToImage==null?AssetImage('assets/unnamed.jpeg'):
                              NetworkImage(snapshot.data.articles[index].urlToImage)

                            )
                            
                          ),

                        ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,right: 10,top: 10,bottom: 10
                          ),
                          child: Text(
                            snapshot.data.articles[index].title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 13
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                left: 10.0,
                                right: 10.0
                              ),
                              width: 30.0,
                              height: 3.0,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(snapshot.data.articles[index].source.name,
                              style: TextStyle(fontSize: 8),),
                              Text(timeAgo(DateTime.parse(snapshot.data.articles[index].publishedAt)),
                              style: TextStyle(fontSize: 10),)

                            ],
                          ),
                          )
                      ],
                    ),
                  ),
                );
              }),
        ),
    
     );
  }
   String timeAgo(DateTime date){
      return timeago.format(date,allowFromNow: true,locale: 'en');
    }
}
