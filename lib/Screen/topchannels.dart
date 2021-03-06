

import 'package:apibasedApp/Model/top.dart';
import 'package:apibasedApp/Network/netwrok.dart';
import 'package:apibasedApp/Top%20Channles%20Names/topcahnnelsname.dart';
import 'package:flutter/material.dart';

class TopChannelsNames extends StatefulWidget {
  @override
  _TopChannelsNamesState createState() => _TopChannelsNamesState();
}

class _TopChannelsNamesState extends State<TopChannelsNames> {
  Future<SourceHeadlines> news;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    news = new Network().getTopnchannelsnames();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: news.asStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return topchannelList(snapshot);
        }
      },
    );
  }

  Widget topchannelList(AsyncSnapshot<SourceHeadlines> snapshot) {
    return ConstrainedBox(
      constraints:BoxConstraints(maxHeight: 150) ,
          child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.sources.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10),
              width: 80,
              child: GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChannelsViewStream(snapshot: snapshot.data.sources[index]))),
                
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                   
                Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow:[ BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: Offset(1.0,1.0)
                          )
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/unnamed.jpeg')
                          )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      
                    
                    

                  Text(snapshot.data.sources[index].name,maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      
                      ),
                      ),
                      SizedBox(height: 5,),
                      Text(snapshot.data.sources[index].category,maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)
                    
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
