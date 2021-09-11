import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/modules/home/widgets/houses.dart';
import 'package:app_find_home/app/modules/profile/widgets/find_home_gold.dart';
import 'package:app_find_home/app/modules/profile/widgets/stadistic_profile.dart';
import 'package:flutter/material.dart';

class ContentProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SliverToBoxAdapter(
            child: /*Align(
                alignment: Alignment.bottomCenter,
                child: */Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 0.0),
                  decoration: BoxDecoration(
                    color: AppTheme.background_white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("FindHome Gold",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700),
                        ),

                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal:  0.0),
                          child: FindHomeGold()
                        ),
                      ]
                    )
              /*  )*/
            )

    );

  }

}