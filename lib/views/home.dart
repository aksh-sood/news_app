import 'package:flutter/material.dart';
import 'package:newz_app_aksh/models/category_models.dart';
import 'package:newz_app_aksh/utilities/category_card.dart';
import 'package:newz_app_aksh/models/data.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 15,
        shadowColor: Colors.purple.shade300,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
            Text('Reads',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DancingScript',
                  color: Colors.purple.shade300,
                  decoration: TextDecoration.underline,
                  decorationThickness: 0.5,
                  decorationColor: Colors.white,
                  // decorationStyle: TextDecorationStyle.double,
                ))
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 12),
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
            )
          ],
        ),
      ),
    );
  }
}
