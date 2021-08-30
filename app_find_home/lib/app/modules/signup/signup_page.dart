import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/modules/signup/signup_controller.dart';
import 'package:app_find_home/app/modules/signup/widgets/content.dart';
import 'package:app_find_home/app/modules/signup/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<SingupController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Header(),
              Content(),
            ],
          ),
        ),
      ),
    );
  }


}