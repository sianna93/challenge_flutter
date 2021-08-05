import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muszy_app/model/song-model.dart';
import 'package:muszy_app/pages/music-play-page.dart';
import 'package:muszy_app/theme/app-theme.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:muszy_app/widgets/today-hist.dart';

class FeaturedPlaylistList extends StatelessWidget {

  List<SongModel>featuredPlays = [];

  FeaturedPlaylistList({required this.featuredPlays});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 81.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: featuredPlays.length,
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MusicPlayPage(song: featuredPlays[index], songList: featuredPlays, index: index,))
                  );
                },
                child:
                  Padding(
                    padding:  index < featuredPlays.length - 1 ? EdgeInsets.only(right: 15.0) : EdgeInsets.all(0),
                    child: FeaturedPlaylistItem(featuredPlaylist: featuredPlays[index], featuredPlaylistColor: index % 2 != 0 ? FeaturedPlaylistColor.PINK : FeaturedPlaylistColor.BLUE)
                  )
            );

          }

      )
    );
  }

}

class FeaturedPlaylistItem extends StatelessWidget {

  final SongModel featuredPlaylist;
  final FeaturedPlaylistColor featuredPlaylistColor;
  double _width = 200.0;
  double _height = 80.0;

  FeaturedPlaylistItem({required this.featuredPlaylist, required this.featuredPlaylistColor});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 2 - 28;
    return
    Container(
      height: _height,
      width: _width ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
            fit: BoxFit.cover,
            image:  featuredPlaylistColor == FeaturedPlaylistColor.PINK ? AssetImage("assets/background1.jpeg") : AssetImage("assets/background2.jpeg")
        ),
        /*boxShadow: [
          BoxShadow(
            color: featuredPlaylistColor == FeaturedPlaylistColor.PINK ?  AppTheme.kBackground_redT : AppTheme.kBackground_purpleT,
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],*/
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
                  colors: featuredPlaylistColor == FeaturedPlaylistColor.PINK ?
                  [
                    AppTheme.kBackground_purpleT,
                    AppTheme.kBackground_redT
                  ] :
                  [
                    AppTheme.kBackground_blue2T,
                    AppTheme.kBackground_blue3T
                  ]
              ),

            ),

          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(width: 15.0),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: (featuredPlaylist.imagePath.length > 0) ?
                      DecorationImage(
                          fit: BoxFit.cover,
                          image:  AssetImage("assets/${featuredPlaylist.imagePath}")
                      ) : DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(featuredPlaylist.imageUrl)
                      )
                  ),
                ),
                SizedBox(width: 15.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(featuredPlaylist.title, style: TextStyle(fontSize: 19.0, color: Colors.white, fontWeight: FontWeight.w500),),
                    SizedBox(height: 2.0,),
                    Text("${featuredPlaylist.numberSongs} songs", style: TextStyle(fontSize: 11.0, color: Colors.white),),
                  ],
                )
              ],
            )
          )

        ],
      ),
    );
  }
}

enum FeaturedPlaylistColor{
  PINK,
  BLUE

}