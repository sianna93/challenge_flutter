import 'package:app_find_home/app/data/model/nothing_model.dart';
import 'package:app_find_home/app/data/model/stadistic_model.dart';
import 'package:app_find_home/app/modules/profile/widgets/stadistic_profile.dart';
import 'package:flutter/material.dart';

class FindHomeGold extends StatelessWidget{
  List<dynamic> stadisitics = [
    new StadisticModel(level: 40, complete_sales: 10, clients: 9),
    new NothingModel(),
    new StadisticModel(level: 20, complete_sales: 8, clients: 2),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 180.0,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stadisitics.length,

            itemBuilder: (context, index){
              return Container(
                  // width: 240.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: _getContainer(stadisitics[index]),
                  )
              );
            },
            separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 20.0);
            },
        )
    );
  }

  _getContainer(dynamic item) {
    Widget result = Container();

    switch (item.runtimeType) {
      case StadisticModel:
        result = StadisticProfile(stadisticModel: item as StadisticModel,);
        break;
      default:
        result = Container(
          padding: EdgeInsets.all(15.0),
          width: 200.0,
          child: Text("Lorem Ipsum is simply dummy text of the printing and "
              "typesetting industry. Lorem Ipsum has been the industry's "
              "standard dummy text ever since the 1500s, when an unknown "
              "printer took a galley of type and scrambled it to make a "
              "type specimen book. I"),
        );
        break;
    }

    return result;
  }

}