import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/stadistic_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StadisticProfile extends StatelessWidget{

  final StadisticModel stadisticModel;

  StadisticProfile({required this.stadisticModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text("Estadistics",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              Container(
                child: CircularPercentIndicator(
                  radius: 90.0,
                  lineWidth: 12.0,
                  percent: (stadisticModel != null ? stadisticModel.level : 0)! / 100 ,
                  center: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${stadisticModel.level}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700)
                        ),
                        Text("Level")
                      ],
                    ),
                  ),
                  progressColor: AppTheme.cyan,
                  backgroundColor: Colors.black38,
                ),
              ),
              SizedBox(width: 15.0,),
              Column(
                children: [
                  Row(
                    children: [

                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 5.0),
                        child: Icon(
                          Icons.attach_money,
                          color: AppTheme.cyan,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${stadisticModel.complete_sales} sales",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700)),
                          Text("Complete",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 0.0, right: 5.0),
                        child: Icon(
                          Icons.person_rounded,
                          color: AppTheme.cyan,
                          size: 25.0,
                        ),
                      ),
                      Text("${stadisticModel.clients} clients",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700)),
                      ]
                  ),
                ],
              )
            ],
          ),

          Padding(
              padding: EdgeInsets.only(top: 15.0),
            child: Text("View more info",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppTheme.cyan, fontWeight: FontWeight.w600)
            )

          )
        ],
      )
    );
  }

}