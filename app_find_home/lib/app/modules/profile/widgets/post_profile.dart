import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/modules/home/home_controller.dart';
import 'package:app_find_home/app/modules/home/widgets/item_house.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<HomeController>(
      builder: (_) => SliverPadding(
        padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight * 1.5),
        sliver: /*Obx(
              () => */SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    color: AppTheme.background_white,
                    child: ItemHouse(house: _.houses[index])
                  ),
              childCount: _.houses.length,
            ),
          ),
        ),
      /*),*/
    );
  }

}

class HeaderPostProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SliverToBoxAdapter(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0, bottom: 0.0),
            color: AppTheme.background_white,
            child: Text("Post",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700),
            )
        )
    );
  }

}