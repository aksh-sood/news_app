import 'package:flutter/material.dart';
import 'package:newz_app_aksh/views/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, backgroundColor: Colors.black54),
      home: Home(),
    );
  }
}
