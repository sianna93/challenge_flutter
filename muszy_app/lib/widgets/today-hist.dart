import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muszy_app/theme/app-theme.dart';

class TodayHitsList extends StatelessWidget {

  List<TodayHitsModel>todayHits = [];

  TodayHitsList({required this.todayHits});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200.0,
      // color: Colors.purple,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: todayHits.length,
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding:  index < todayHits.length - 1 ? EdgeInsets.only(right: 15.0) : EdgeInsets.all(0),
              child: TodayHistsItem(todayHit: todayHits[index], todayHitColor: index % 2 != 0 ? TodayHitColor.BLUE : TodayHitColor.PINK)
            );

          }

      )
    );
  }

}

class TodayHistsItem extends StatelessWidget {

  final TodayHitsModel todayHit;
  final TodayHitColor todayHitColor;
  double _width = 130.0;
  double _height = 130.0;

  TodayHistsItem({required this.todayHit, required this.todayHitColor});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 3 - 23;
    _height = _width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: _height,
            width: _width ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: (todayHit.imagePath.length > 0) ? DecorationImage(
                    fit: BoxFit.cover,
                    image:  AssetImage("assets/${todayHit.imagePath}")
                ) : DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(todayHit.imageUrl)
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
                          colors: todayHitColor == TodayHitColor.PINK ?
                          [
                            AppTheme.kBackground_purpleT,
                            AppTheme.kBackground_redT
                          ] :
                          (todayHitColor == TodayHitColor.YELLOW ?
                          [
                            AppTheme.kBackground_brownT,
                            AppTheme.kYellowT
                          ]
                              :
                          [
                            AppTheme.kBackground_blue2T,
                            AppTheme.kBackground_blue3T
                          ]
                          )
                      ),

                    )
                ),
                /* Play Icon */
                Align(
                  alignment: Alignment.center,
                  child:
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          child:  ClipRect(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      color: Color(0xFF82858c).withOpacity(0.4),
                                    )
                                )
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.play_arrow, size: 24.0, color: Color(0xFF82858c),),
                        ),
                      )

                    ],
                  ),
                )

              ],
            ),
          ) ,
        SizedBox(height: 15.0),
        Text(this.todayHit.title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
        SizedBox(height: 6.0),
        Text(this.todayHit.author, style: TextStyle(color: AppTheme.kSubtitle, fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.start)
      ],
    );


  }
}

class TodayHitsModel{
  final String imagePath;
  String imageUrl = '';
  String title;
  String author;

  TodayHitsModel({required this.imagePath, this.imageUrl = '', required this.title, required this.author});
}

enum TodayHitColor{
  PINK,
  BLUE,
  YELLOW

}