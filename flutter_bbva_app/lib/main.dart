import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/pages/home-page.dart';
import 'package:flutter_bbva_app/pages/login-page.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';
import 'pages/splash-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BBVA',
      theme: ThemeData(
        primaryColor: AppTheme.kBackground,
      ),
       // home: SplashPage(),
       // home: LoginPage(),
       home: HomePage(),
    );
  }
}

