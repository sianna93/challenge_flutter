

import 'package:flutter/material.dart';
import 'package:muszy_app/model/song-model.dart';
import 'package:muszy_app/theme/app-theme.dart';
import 'package:muszy_app/widgets/daily-mix.dart';
import 'package:muszy_app/widgets/featured-playlist.dart';
import 'package:muszy_app/widgets/search-bar.dart';
import 'package:muszy_app/widgets/today-hist.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color: AppTheme.kBackground,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchBar(),
            SizedBox(height: 30.0,),
            DailyMixList(dailies: [
              new SongModel(imagePath: "daily-mix2.jpeg", title: "Daily Mix"),
              new SongModel(imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-BNIcbXbbO40LaNrAj2lbAr_zT7B-kgC9gw&usqp=CAU'", title: "Daily Mix"),
              new SongModel(imagePath: "daily-mix3.jpeg", title: "Daily Mix"),
              new SongModel(imagePath: "daily-mix.jpeg", title: "Daily Mix"),
            ]),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Text("Featured Playlist", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Text("View All", style: TextStyle(color: AppTheme.kYellow, fontSize: 18.0, fontWeight: FontWeight.bold), textAlign: TextAlign.end, ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            FeaturedPlaylistList(featuredPlays: [
              new SongModel(imagePath: "study.jpeg", title: "Study", numberSongs: 89),
              new SongModel(imagePath: "hiphop.jpeg", title: "Hip-Hop", numberSongs: 68),
              new SongModel(imagePath: "rock.jpeg", title: "Rock", numberSongs: 200),
              new SongModel(imagePath: "hiphop.jpeg", title: "Relax", numberSongs: 18),

            ]),

            SizedBox(height: 30.0,),
            Row(
              children: [
                Text("Today Hits", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Text("View All", style: TextStyle(color: AppTheme.kYellow, fontSize: 18.0, fontWeight: FontWeight.bold), textAlign: TextAlign.end, ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            TodayHitsList(todayHits: [
              new SongModel(title: 'Goodbyes', author: 'Tomorrowland',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8JIiKK46CX4EJgz01G-j7ZBvVxb1NFTdV4A&usqp=CAU"),
              new SongModel(title: 'Cold', author: 'Mashmellow',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmbpHXFKeYGoS4lD0CVYxle0GanDjgShNJ4Q&usqp=CAU"),
              new SongModel(title: 'Funky', author: 'Lauv',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdZ1TYnTMoFHLZ414qSHtnRIk9Ro4Ar4OgBQ&usqp=CAU"),
              new SongModel(title: 'Magic', author: 'Dina Love',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-BNIcbXbbO40LaNrAj2lbAr_zT7B-kgC9gw&usqp=CAU'"),
              new SongModel(title: 'Party', author: 'Mashmellow',
                  imagePath: "daily-mix3.jpeg"),
              new SongModel(title: 'Extreme', author: 'Mashmellow',
                  imagePath: "daily-mix.jpeg"),
            ]),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}