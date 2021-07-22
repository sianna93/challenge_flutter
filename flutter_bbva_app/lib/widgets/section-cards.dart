import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';
import 'package:flutter_bbva_app/widgets/card-list.dart';

class SectionCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text("Tus tarjetas",
              style: TextStyle(
                  color: AppTheme.kBackground,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold
              ),
            )
          ),
          SizedBox(height: 10.0,),
          CardList(),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }

}

