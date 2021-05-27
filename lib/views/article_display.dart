import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  final String newsUrl;
  Article({this.newsUrl});

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 15,
        shadowColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "title1",
              child: Text(
                'Daily',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DancingScript',
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationThickness: 0.5,
                  // decorationColor: Colors.white,
                  // decorationStyle: TextDecorationStyle.double,
                ),
              ),
            ),
            Hero(
              tag: "title2",
              child: Text('Reads',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    // fontFamily: 'DancingScript',
                    color: Colors.purple.shade300,
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.5,
                    decorationColor: Colors.white,
                    // decorationStyle: TextDecorationStyle.double,
                  )),
            ),
            Icon(
              Icons.save,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: ((WebViewController webviewController) {
            _completer.complete(webviewController);
          }),
        ),
      ),
    );
  }
}
