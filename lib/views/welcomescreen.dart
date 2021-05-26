import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitDualRing(
                color: Colors.white,
                size: 30,
              ),
              Hero(
                tag: "title1",
                child: Text(
                  'Daily',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DancingScript',
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.5,
                    decorationColor: Colors.white,
                    // decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
              Hero(
                tag: "title2",
                child: Text(
                  'Reads',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    // fontFamily: 'DancingScript',
                    color: Colors.purple.shade300,
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.5,
                    decorationColor: Colors.white,
                    // decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
              SpinKitDualRing(
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
