import 'package:flutter/material.dart';
import 'package:muszy_app/pages/home-page.dart';
import 'package:muszy_app/theme/app-theme.dart';
import 'package:muszy_app/widgets/daily-mix.dart';
import 'package:muszy_app/widgets/featured-playlist.dart';

import 'non-page.dart';

class InitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitPageState();

}

class InitPageState extends State<InitPage> {
  int _selectedIndex = 2;

  List<Widget> _pages = <Widget>[
    NonPage(title: "Login Page"),
    NonPage(title: "Equalizer Page"),
    HomePage(),
    NonPage(title: "Music List Page"),
    NonPage(title: "Music Discs Page"),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 2;
  }

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

      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.kBackground_navigation,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomNavigationBarItem(icon: Icons.person),
          _bottomNavigationBarItem(icon: Icons.tune),
          _bottomNavigationBarItem(icon: Icons.home),
          _bottomNavigationBarItem(icon: Icons.queue_music_sharp),
          _bottomNavigationBarItem(icon: Icons.album)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.kBackground_blue3,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) => setState(() => _selectedIndex = index),

      ), // This tra
    );
  }

  _bottomNavigationBarItem({icon: IconData}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 32.0,),
      label: ''
    );
  }

}