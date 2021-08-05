import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muszy_app/model/song-model.dart';
import 'package:muszy_app/theme/app-theme.dart';
import 'package:muszy_app/widgets/lyrics.dart';
import 'package:muszy_app/widgets/play-icon.dart';
import 'package:muszy_app/widgets/today-hist.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class MusicPlayPage extends StatefulWidget {

  final SongModel song;

  final List<SongModel> songList;
  int index = 0;

  MusicPlayPage({required this.song, required this.songList, this.index = 0});

  @override
  MusicPlayState createState() => MusicPlayState();
}

class MusicPlayState extends State<MusicPlayPage> {
  late SwiperController swipeController;
  double _valueTrack = 0;

  @override
  void initState() {
    swipeController = new SwiperController();
    // _valueTrack = widget.song.timeMinutes * 0.4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: AppTheme.kBackground,

      body: Container(

          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.kBackground,
                  // borderRadius: BorderRadius.circular(20.0),
                  image: (widget.song.imagePath.length > 0) ? DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      fit: BoxFit.cover,
                      image:  AssetImage("assets/${widget.song.imagePath}")
                  ) : DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.song.imageUrl)
                  ),

                ),

              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 50.0,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.0),
                          ),

                          Expanded(
                              child: Text("Music Player",
                                style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                          ),
                          Icon(Icons.more_horiz, color: Colors.white, size: 20.0,),
                        ],
                      ),
                    ),

                    SizedBox(height: 35.0,),
                    Container(
                        height:  MediaQuery.of(context).size.height / 3 + 15.0,
                        width:  MediaQuery.of(context).size.width,
                        child: Swiper(
                          controller: swipeController,
                          itemBuilder: (BuildContext context, int index) {
                            return MusiPlayItem(todayHit: widget.song, todayHitColor: TodayHitColor.BLUE, todayHits: widget.songList);
                          },
                          itemCount: widget.songList.length,
                          itemWidth: MediaQuery.of(context).size.width - 70.0,
                          itemHeight: MediaQuery.of(context).size.height / 3 + 20.0,
                          viewportFraction: 0.75,
                          scale: 0.85,
                          index: widget.index,
                        ),
                    ),

                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20.0,),
                              Text(widget.song.title,
                                style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0,),

                              Text(widget.song.author,
                                style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 40.0,),
                              LyricsWidget(lyrics: widget.song.lyrics, scrollPosition: _valueTrack, maxValue: widget.song.timeMinutes)

                            ],
                          ),
                        )

                    ),
                    SizedBox(height: 140.0,)



                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 4,
                  shadowColor: Colors.white,
                  child: Container(
                    height: 150.0,
                    color: AppTheme.kBackground,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 15.0, right: 5.0),
                                child: Text(_getTimeCurrent(_valueTrack),
                                  style: TextStyle(color: AppTheme.kSubtitle, fontSize: 12.0,),
                                )
                            ),
                            Expanded(
                                child: Slider(
                                  min: 0,
                                  //divisions: 6,
                                  value: _valueTrack, onChanged: (value) {
                                    setState(() {
                                      _valueTrack = value;
                                    });
                                  },
                                  max: widget.song.timeMinutes,
                                  inactiveColor: AppTheme.kBackground_purpleT,
                                  activeColor: AppTheme.kBackground_blue3,
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5.0, right: 15.0),
                                child: Text(widget.song.time,
                                  style: TextStyle(color: AppTheme.kSubtitle, fontSize: 12.0,),
                                )
                            ),

                          ],
                        ),
                        Expanded(
                          child: Container(
                            //color: Colors.purple,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                _actionMusic(icon: Icons.shuffle, size: ActionMusicSize.SMALL, active: false),
                                _actionMusic(icon: Icons.fast_rewind, size: ActionMusicSize.MEDIUM, active: false),
                                _actionMusic(icon: Icons.play_circle_filled, size: ActionMusicSize.HIGH, active: true),
                                _actionMusic(icon: Icons.fast_forward, size: ActionMusicSize.MEDIUM, active: false),
                                _actionMusic(icon: Icons.tune, size: ActionMusicSize.SMALL, active: false),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,)



                      ],
                    ),
                  ),
                )

              )
            ],
          )
      ),

    );
  }

  _actionMusic({icon: IconData, size: ActionMusicSize, active: bool}){
    return Container(
      width: MediaQuery.of(context).size.width / 5 - 30,
      child: Icon(icon, color: active ? AppTheme.kBackground_blue3 : Colors.white,
        size: size == ActionMusicSize.SMALL ? 22.0 : (size == ActionMusicSize.MEDIUM ? 36.0 : 50.0 ),
      ),
    );
  }

  String _getTimeCurrent(double timeMinutes){
    if (timeMinutes != null) {
      double minutes = timeMinutes/60;
      int minutes_int = minutes.toInt();
      double new_seconds = (minutes - minutes_int) * 100;
      int seconds_int = new_seconds.toInt() ;
      String seconds_str = (seconds_int != null && seconds_int < 10) ? "0"+ seconds_int.toString() : seconds_int.toString();

      return "${minutes_int}:$seconds_str";
    }
     return "0:00";
  }

}

class MusiPlayItem extends StatelessWidget {
  final List<SongModel> todayHits;
  final SongModel todayHit;
  final TodayHitColor todayHitColor;
  double _width = 130.0;
  double _height = 130.0;

  MusiPlayItem({required this.todayHit, required this.todayHitColor, required this.todayHits});

  @override
  Widget build(BuildContext context) {
    // _height =  MediaQuery.of(context).size.height / 3;
    // _width =  MediaQuery.of(context).size.width / 2 ;
    // TODO: implement build
    return Container(
      height: _height,
      width: _width,
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width ,
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
            child: PlayIconWidget(customWidth: 80.0, customHeight: 80.0,)
          )

        ],
      ),
    );
  }

}

enum ActionMusicSize {
  SMALL,
  MEDIUM,
  HIGH
}