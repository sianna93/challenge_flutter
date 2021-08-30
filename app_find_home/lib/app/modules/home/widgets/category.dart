import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SliverToBoxAdapter(
        child: Container(
          height: 100.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // _.selectedIndex(index);
                },
                child: ItemCategory(
                  category: categories[index],
                  index: index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  ItemCategory({
    @required this.category,
    @required this.index,
  });

  final CategoryModel? category;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Obx(
            () {
          bool isSelected = index == /*_.isSelectedIndex.value ? true :*/ false;
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 85.0,
            margin: EdgeInsets.only(
              left: isSelected ? 20.0 : 11.0,
              bottom: isSelected ? 0 : 20.0,
            ),
            decoration: BoxDecoration(
              /*color: index == _.isSelectedIndex.value
                  ? AppTheme.cyan
                  : Colors.white,*/
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  category!.path ?? "",
                  width: 30.0,
                  color: isSelected
                      ? Colors.white
                      : AppTheme.light.withOpacity(.5),
                ),
                isSelected
                    ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      right: 5.0,
                      left: 5.0,
                    ),
                    child: Text(
                      category!.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                    : SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}