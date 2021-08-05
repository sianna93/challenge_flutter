import 'package:flutter/material.dart';
import 'package:muszy_app/pages/home-page.dart';
import 'package:muszy_app/pages/init-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muszy',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: InitPage(),
    );
  }
}

