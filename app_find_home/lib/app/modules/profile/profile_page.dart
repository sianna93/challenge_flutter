import 'package:app_find_home/app/modules/home/widgets/houses.dart';
import 'package:app_find_home/app/modules/profile/widgets/header_profile.dart';
import 'package:app_find_home/app/modules/profile/widgets/post_profile.dart';
import 'package:flutter/material.dart';

import 'widgets/content_profile.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                slivers: [
                    HeaderProfile(),
                    ContentProfile(),
                    HeaderPostProfile(),
                    PostProfile(),
                ]
              )
            )
          ]
      )

    );
  }

}