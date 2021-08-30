import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      color: AppTheme.background,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*SizedBox(height: 200.0,),*/

            SvgPicture.asset("assets/icons/find_home.svg"),
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
          ]


      ),
    );
  }

}