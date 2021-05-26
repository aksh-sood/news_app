import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl, title, content;
  NewsTile(
      {@required this.imageUrl, @required this.title, @required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: Column(children: [
        Image.network(imageUrl),
        Text(title),
        Text(content),
      ])),
    );
  }
}
