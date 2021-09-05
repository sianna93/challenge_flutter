import 'package:app_find_home/app/modules/detail/detail_controller.dart';
import 'package:app_find_home/app/modules/detail/widgets/appbar_actions.dart';
import 'package:app_find_home/app/modules/detail/widgets/content.dart';
import 'package:app_find_home/app/modules/detail/widgets/footer.dart';
import 'package:app_find_home/app/modules/detail/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GetBuilder<DetailController>(
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            Header(path: _.houseModel.photo ?? ""),
            AppBarActions(aviable: _.houseModel.aviable ?? 0,),
            Content(house: _.houseModel),
            Footer(house: _.houseModel),
          ],
        ),
      ),
    );
    /*return GetBuilder<DetailController>(
        builder: (_) => Scaffold(
          appBar: AppBar(
            actions: [
              Hero(
                tag: "key_${_.houseModel.photo}",
                child: CircleAvatar(
                  foregroundImage: NetworkImage(""),
                ),
              )

            ],
          ),
    ));*/
  }

}