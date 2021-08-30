import 'package:app_find_home/app/modules/detail/detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<DetailController>(
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
    ));
  }

}