import 'package:flutter/material.dart';
import 'package:muszy_app/theme/app-theme.dart';

class SearchBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: AppTheme.kBackground_search
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 15.0),
          child: Row(
            children: [
              Icon(Icons.search, color: AppTheme.kSubtitle, size: 30.0),
              SizedBox(width: 15.0),
              Expanded(
                child: TextField(
                  style: TextStyle(color: AppTheme.kSubtitle, fontSize: 18.0),
                  cursorColor: AppTheme.kBackground_purple,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppTheme.kSubtitle, fontSize: 16.0),
                      focusColor: AppTheme.kBackground_purple,
                      hoverColor: AppTheme.kBackground_purple,
                      hintText: 'Search something here',
                      hintStyle:  TextStyle(color: AppTheme.kSubtitle, fontSize: 16.0),
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none
                  ),
                ),
              )

              // Text('Search something here', style: TextStyle(color: AppTheme.kSubtitle, fontSize: 16.0),)
            ],
          ),
        )

    );
  }


}