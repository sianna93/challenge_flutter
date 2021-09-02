import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/global_widgets/button_navigator.dart';
import 'package:app_find_home/app/modules/home/widgets/category.dart';
import 'package:app_find_home/app/modules/home/widgets/header_home.dart';
import 'package:app_find_home/app/modules/home/widgets/houses.dart';
import 'package:app_find_home/app/modules/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget{

  HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.background_white,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    HeaderHome(),
                    Search(),
                    Category(),
                    Houses(),
                  ],
                ),
              ),
              ButtonNavigator()
            ],
          ),
        ),
      ),
    );
  }

}