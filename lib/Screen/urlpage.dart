import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoad extends StatefulWidget {
  final String url;
  const WebViewLoad({
    Key key,
    this.url,
  }) : super(key: key);

  WebViewLoadUI createState() => WebViewLoadUI();
}

class WebViewLoadUI extends State<WebViewLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Read More')),
        body: WebView(
          initialUrl: '${widget.url}',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
