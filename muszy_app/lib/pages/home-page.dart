import 'package:flutter/material.dart';
import 'package:muszy_app/theme/app-theme.dart';
import 'package:muszy_app/widgets/daily-mix.dart';
import 'package:muszy_app/widgets/featured-playlist.dart';
import 'package:muszy_app/widgets/today-hist.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.kBackground,
        leadingWidth: 120,
        elevation: 0,
        leading: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 15.0),
            child: Text('Discover', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
        ),

        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: AppTheme.kBackground_blue2,),
                radius: 18.0,
              )
          ),
        ],
      ),
      body: Container(
        color: AppTheme.kBackground,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: AppTheme.kBackground_search
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color(0xFF82858c), size: 30.0),
                    SizedBox(width: 15.0),
                    Text('Search something here', style: TextStyle(color: Color(0xFF82858c), fontSize: 16.0),)
                  ],
                ),
              )

            ),
            SizedBox(height: 20.0,),
            DailyMixList(dailies: [
              new DailyMixModel(imagePath: "daily-mix2.jpeg", title: "Daily Mix"),
              new DailyMixModel(imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-BNIcbXbbO40LaNrAj2lbAr_zT7B-kgC9gw&usqp=CAU'", title: "Daily Mix"),
              new DailyMixModel(imagePath: "daily-mix3.jpeg", title: "Daily Mix"),
              new DailyMixModel(imagePath: "daily-mix.jpeg", title: "Daily Mix"),
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
              new FeaturedPlaylistModel(imagePath: "study.jpeg", title: "Study", numberSongs: 89),
              new FeaturedPlaylistModel(imagePath: "hiphop.jpeg", title: "Hip-Hop", numberSongs: 68),
              new FeaturedPlaylistModel(imagePath: "rock.jpeg", title: "Rock", numberSongs: 200),
              new FeaturedPlaylistModel(imagePath: "hiphop.jpeg", title: "Relax", numberSongs: 18),

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
              new TodayHitsModel(title: 'Goodbyes', author: 'Tomorrowland',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8JIiKK46CX4EJgz01G-j7ZBvVxb1NFTdV4A&usqp=CAU"),
              new TodayHitsModel(title: 'Cold', author: 'Mashmellow',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmbpHXFKeYGoS4lD0CVYxle0GanDjgShNJ4Q&usqp=CAU"),
              new TodayHitsModel(title: 'Funky', author: 'Lauv',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdZ1TYnTMoFHLZ414qSHtnRIk9Ro4Ar4OgBQ&usqp=CAU"),
              new TodayHitsModel(title: 'Magic', author: 'Dina Love',
                  imagePath: '', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-BNIcbXbbO40LaNrAj2lbAr_zT7B-kgC9gw&usqp=CAU'"),
              new TodayHitsModel(title: 'Party', author: 'Mashmellow',
                  imagePath: "daily-mix3.jpeg"),
              new TodayHitsModel(title: 'Extreme', author: 'Mashmellow',
                  imagePath: "daily-mix.jpeg"),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.kBackground_navigation,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 32.0,),
              label: ''
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tune, size: 32.0),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 32.0),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.queue_music_sharp, size: 32.0),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.disc_full, size: 32.0),
              label: ''),
        ],
        currentIndex: 2,
        selectedItemColor: AppTheme.kBackground_blue3,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
