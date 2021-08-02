import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muszy_app/theme/app-theme.dart';

class DailyMixList extends StatelessWidget {

  List<DailyMixModel>dailies = [];

  DailyMixList({required this.dailies});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: dailies.length,
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding:  index < dailies.length - 1 ? EdgeInsets.only(right: 15.0) : EdgeInsets.all(0),
              child: DailyMixItem(dailyMix: dailies[index], dailyColor: index % 2 != 0 ? DailyColor.BLUE : DailyColor.PINK)
            );

          }

      )
    );
  }

}

class DailyMixItem extends StatelessWidget {

  final DailyMixModel dailyMix;
  final DailyColor dailyColor;
  double _width = 250.0;
  double _height = 150.0;

  DailyMixItem({required this.dailyMix, required this.dailyColor});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: _height,
      width: _width ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: (dailyMix.imagePath.length > 0) ? DecorationImage(
            fit: BoxFit.cover,
            image:  AssetImage("assets/${dailyMix.imagePath}")
        ) : DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(dailyMix.imageUrl)
        )
      ),
      child: Stack(
        children: [

          Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: dailyColor == DailyColor.PINK ?
                  [
                    AppTheme.kBackground_purpleT,
                    AppTheme.kBackground_redT
                  ] :
                  [
                    AppTheme.kBackground_blue2T,
                    AppTheme.kBackground_blue3T
                  ]
              ),

            )
          ),
          Align(
            alignment: Alignment.center,
            child: Text(dailyMix.title, style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold), ),
          )

        ],
      ),
    );
  }
}

class DailyMixModel{
  final String imagePath;
  String imageUrl = '';
  final String title;

  DailyMixModel({required this.imagePath, required this.title, this.imageUrl = ''});
}

enum DailyColor{
  PINK,
  BLUE

}