import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newz_app_aksh/networking/news.dart';
import 'package:newz_app_aksh/models/Article_model.dart';
import 'package:newz_app_aksh/utilities/news_tile.dart';
import 'package:newz_app_aksh/models/data.dart';
import 'package:newz_app_aksh/utilities/category_card.dart';
import 'package:newz_app_aksh/models/category_models.dart';

class CategoryNewz extends StatefulWidget {
  final String category;
  CategoryNewz({@required this.category});

  @override
  _CategoryNewzState createState() => _CategoryNewzState();
}

class _CategoryNewzState extends State<CategoryNewz> {
  List<ArticleModel> articles = new List();
  List<CategoryModel> categories = new List<CategoryModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategory();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews news = CategoryNews();
    await news.getCategoryNews(widget.category);
    articles = news.newsData;
    setState(() {
      _loading = false;
    });
  }

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
      body: _loading
          ? Center(
              child: SpinKitFoldingCube(
                color: Colors.purple.shade300,
              ),
            )
          : ListView(
              children: [
                SizedBox(height: 12),

                /// category
                Container(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        imageUrl: categories[index].imageUrl,
                        category: categories[index].categoryName,
                      );
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return NewsTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          url: articles[index].url,
                          description: articles[index].description);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
