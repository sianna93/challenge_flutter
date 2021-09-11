import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:app_find_home/app/modules/home/widgets/item_house.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class Houses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SliverPadding(
        padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight * 1.5),
        sliver: Obx(
              () => SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemHouse(house: _.houses[index]),
              childCount: _.houses.length,
            ),
          ),
        ),
      ),
    );
  }
}

