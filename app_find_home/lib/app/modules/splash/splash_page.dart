import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget{

  SplashPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<SplashController>(
       // init: SplashController(), se va a hacer con inyección de dependencia
        builder: (_) => Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppTheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SvgPicture.asset("assets/icons/find_home.svg"),
                  /*Icon(Icons.home),*/ /*Image(
                            image: AssetImage(""))*/
                  RichText(
                      text: TextSpan(
                        text: "Find",
                          style: Theme.of(context).textTheme.headline4?.
                          copyWith(
                              color: AppTheme.primaryDark,
                              fontWeight: FontWeight.w900
                          ),
                        children: [
                          TextSpan(
                            text: "Home",
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                            ),
                          )

                        ]
                      )
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 150.0,
                    child: LinearProgressIndicator(
                      /*value: 0.5,*/
                      color: Colors.white
                    ),
                  )
              ]


            ),
          )
        )
   );
  }
}