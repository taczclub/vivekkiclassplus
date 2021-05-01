import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../services/base_url.dart';

class WebViewClass extends StatefulWidget {
  final String url;
  const WebViewClass({@required this.url});
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebViewClass> {
  num position = 1;

  final key = UniqueKey();

  doneLoading(String A) {
    if (position != 2) {
      setState(() {
        position = 0;
      });
    }
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: position, children: <Widget>[
      WebView(
        onWebResourceError: (WebResourceError webviewerrr) {
          setState(() {
            position = 2;
          });
        },
        initialUrl: baseURL + widget.url,
        // initialUrl: 'https://google.com',
        javascriptMode: JavascriptMode.unrestricted,
        key: key,
        onPageStarted: startLoading,
        onPageFinished: doneLoading,
      ),
      Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator()),
      ),
      Container(
        color: Colors.white,
        child: Center(
            child: Text(
          'Something went wrong check your internet connection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    ]);
  }
}
