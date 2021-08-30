import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadSpinner {
  static show(){
    Get.dialog(
      Container(
        alignment: Alignment.center,
          height: 40.0,
        padding: EdgeInsets.all(60.0),
        child: CircularProgressIndicator(
          color: AppTheme.blueDark
        ),
      ),
      barrierColor: Colors.white60,
      barrierDismissible: false
    );
  }

  static hide(){
    Get.back();

    // Similar a un navigator .pop
  }
}
