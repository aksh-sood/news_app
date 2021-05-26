import 'package:flutter/material.dart';
import 'package:newz_app_aksh/views/article_display.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  NewsTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.url,
      @required this.description});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Article(
                newsUrl: url,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // radius of 10.
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // radius of 10.
              color: Colors.black87,
            ),
            child: Column(children: [
              Image.network(imageUrl),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
