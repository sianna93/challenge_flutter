import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/modules/login/widgets/content.dart';
import 'package:app_find_home/app/modules/login/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatelessWidget{
  LoginPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child:  SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Container(
               color: AppTheme.background,
               height: MediaQuery.of(context).size.height,
               child: Column(
                 children: [
                   HeaderLogin(),
                   ContentLogin(),
                   /*Align(
                       alignment: Alignment.bottomCenter,
                       child: Container(
                         width: double.infinity,
                         height: MediaQuery.of(context).size.height - 225.0,
                         //height: 400.0,
                         child: ContentLogin(),
                       )

                   )*/

                 ],
               ),
             ),
           )
      )

    );
  }

}