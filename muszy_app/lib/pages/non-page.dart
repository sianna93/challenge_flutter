import 'package:flutter/material.dart';
import 'package:muszy_app/theme/app-theme.dart';

class NonPage extends StatefulWidget{

  NonPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  NonPageState createState() => NonPageState();
}

class NonPageState extends State<NonPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${widget.title}",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: AppTheme.kBackground_blue)
          ),
          Text("is comming",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: AppTheme.kBackground_brown)
          ),
        ],
      ),
    );
  }

}