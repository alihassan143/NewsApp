import 'package:apibasedApp/Model/article.dart';
import 'package:apibasedApp/Network/netwrok.dart';
import 'package:apibasedApp/Screen/gridview.dart';
import 'package:flutter/material.dart';

import 'package:apibasedApp/Model/top.dart';

class ChannelsViewStream extends StatefulWidget {
  final Sources snapshot;
  const ChannelsViewStream({
    Key key,
    this.snapshot,
  }) : super(key: key);

  @override
  _ChannelsViewStreamState createState() =>
      _ChannelsViewStreamState(snapshot: snapshot);
}

class _ChannelsViewStreamState extends State<ChannelsViewStream> {
  final Sources snapshot;
  Future<News> channelview;
  @override
  void initState() {
    super.initState();
    channelview = Network().getChanneldata(search: snapshot.id);
  }

  _ChannelsViewStreamState({this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.name),
      ),
      body: StreamBuilder(
        stream: channelview.asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridViewPage(
              snapshot: snapshot,
            );
          }
        },
      ),
    );
  }
}
