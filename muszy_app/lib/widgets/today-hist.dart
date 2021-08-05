import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muszy_app/model/song-model.dart';
import 'package:muszy_app/pages/music-play-page.dart';
import 'package:muszy_app/theme/app-theme.dart';
import 'package:muszy_app/widgets/play-icon.dart';

class TodayHitsList extends StatelessWidget {

  List<SongModel>todayHits = [];

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
              child: TodayHistsItem(todayHits: todayHits, todayHit: todayHits[index], index: index, todayHitColor: index % 2 != 0 ? TodayHitColor.BLUE : TodayHitColor.PINK)
            );

          }

      )
    );
  }

}

class TodayHistsItem extends StatelessWidget {

  final List<SongModel> todayHits;
  final SongModel todayHit;
  int index = 0;
  final TodayHitColor todayHitColor;
  double _width = 130.0;
  double _height = 130.0;

  TodayHistsItem({required this.todayHit, required this.todayHitColor, required this.todayHits, this.index = 0});

  @override
  Widget build(BuildContext context) {

    _width = MediaQuery.of(context).size.width / 3 - 23;
    _height = _width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MusicPlayPage(song: todayHit, songList: todayHits, index: index,))
            );
          },
          child: Container(
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
                  child: PlayIconWidget(customWidth: 50.0, customHeight: 50.0,)
                )

              ],
            ),
          ) ,

        ),

        SizedBox(height: 15.0),
        Text(this.todayHit.title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
        SizedBox(height: 6.0),
        Text(this.todayHit.author, style: TextStyle(color: AppTheme.kSubtitle, fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.start)
      ],
    );


  }
}

enum TodayHitColor{
  PINK,
  BLUE,
  YELLOW

}