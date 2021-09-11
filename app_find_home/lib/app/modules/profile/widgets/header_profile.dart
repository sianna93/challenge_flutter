import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../profile_controller.dart';

class HeaderProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: true,
      expandedHeight: 150.0,
      backgroundColor: Colors.white,
      leading: Container(
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: _SliverAppBar(),
      ),
      stretch: true,
      stretchTriggerOffset: 10.0,
      onStretchTrigger: () async {
        print("onStretchTrigger");
      },
    );
  }

}

class _SliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) => Container(
        margin: EdgeInsets.only(top: 70.0),
        child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_.userModel.name} ${_.userModel.lastname}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppTheme.blueDark, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: _stars(context: context, stars: 4),
                      ),
                      /*Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),*/
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/location.svg', width: 15),
                            Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Text(
                                "${_.userModel.address}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: AppTheme.blueDark),
                              ),
                            ),
                          ],
                        ),


                    ],
                  ),
                  SizedBox(width: 35.0,),
                  CircleAvatar(
                    radius: 40.0,
                    foregroundImage: NetworkImage(
                        "https://i.pinimg.com/474x/98/6d/69/986d69105df94498ea96e53a7495de19.jpg"),
                  )
                ],
              ),
            ),
      ),
    );
  }

  Widget _stars({required BuildContext context, int stars = 0}) {
    List<Widget> list = [];
    for(var i = 0; i < 5; i++){
      list.add(
          SvgPicture.asset("assets/icons/star.svg",
            color: i < stars ? AppTheme.cyan : Colors.black12,
            height: 20.0,
            width: 20.0,
          ),
      );
    }
    list.add(
        Text("(10)",
          style:  Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppTheme.light, fontWeight: FontWeight.w400),
        )
    );
    return new Container(
      width: 140.0,
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: list
        )
    );
  }
}