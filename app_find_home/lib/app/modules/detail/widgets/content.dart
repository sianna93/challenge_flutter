import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:app_find_home/app/modules/detail/widgets/content_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Content extends StatelessWidget {
  Content({
    required this.house,
  });

  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    final arrTags = house.utilities!.split(',');

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.60,
        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          color: AppTheme.background_white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: SvgPicture.asset(
                                  "assets/icons/location.svg",
                                  width: 18.0,
                                  color: Colors.black54,
                                ),
                                alignment: PlaceholderAlignment.middle,
                              ),
                              WidgetSpan(
                                child:  Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text("${house.location}",
                                    style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                  ),
                                )
                              )
                            ],
                          )
                        ),
                        SizedBox(height: 6.0,),
                        Text(
                          "${house.name}",
                          style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppTheme.blueDark,
                              fontWeight: FontWeight.w600),
                        )
                    ]
                  )
                ),
                CircleAvatar(
                  foregroundImage: NetworkImage(house.avatar ?? ""),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: _utilitiesTags(context, arrTags)
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                _infoRoom(context: context, count: house.bedroom ?? 0, pathImg: "assets/icons/bedroom.svg"),
                SizedBox(width: 40.0,),
                _infoRoom(context: context, count: house.bathroom ?? 0, pathImg: "assets/icons/bathroom.svg"),
                SizedBox(width: 40.0,),
                _infoRoom(context: context, count: house.menu ?? 0, pathImg: "assets/icons/menu.svg"),
              ],
            ),
            SizedBox(height: 20.0,),
            ContentInformation(house: house,)

          ],
        ),
      ),
    );
  }

  _utilitiesTags(BuildContext context, List<String> arrTags) {
      List<Widget> tags = [];

      arrTags.asMap().forEach((index, element) {
        tags.add(
          Text(element.replaceAll("'", ""),
            style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black54,
                fontWeight: FontWeight.w400),
          )
        );

        if (index < arrTags.length - 1) {
          tags.add(
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child:  CircleAvatar(
                backgroundColor: AppTheme.cyan.withOpacity(0.7),
                radius: 2.0,
                )
            )

          );
        }
      });
      return tags;
  }

  _infoRoom({required BuildContext context, required String pathImg, required int count}) {
    return Row(
      children: [
        SvgPicture.asset(
          pathImg,
          width: 22.0,
          color: Colors.cyan,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text("${count}",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black54,
                fontWeight: FontWeight.w400),

          )
        )

      ],
    );
  }
}

