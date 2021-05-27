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
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.5),
                  spreadRadius: 0.1,
                  blurRadius: 10,
                  offset: Offset(4, 10), // changes position of shadow
                ),
              ], // radius of 10.

              borderRadius: BorderRadius.circular(20), // radius of 10.
              color: Colors.black87,
            ),
            child: Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.network(imageUrl))),
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
                    color: Color(0xffce93d8),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
