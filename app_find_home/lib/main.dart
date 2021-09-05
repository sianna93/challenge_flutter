import 'package:app_find_home/app/core/utils/dependency_injection.dart';
import 'package:app_find_home/app/modules/splash/splash_binding.dart';
import 'package:app_find_home/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  DependencyInjection.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SplashPage(),
      //initialRoute: '/splash',
      // initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
