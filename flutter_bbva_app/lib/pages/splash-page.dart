import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: AppTheme.kBackground,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
            child: Image(
              image: AssetImage("assets/BBVA_2019_splash.png"),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        ),
      ),
    );
  }

}