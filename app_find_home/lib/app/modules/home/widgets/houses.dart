import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class Houses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SliverPadding(
        padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight * 1.5),
        sliver: Obx(
              () => SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemHouse(house: _.houses[index]),
              childCount: _.houses.length,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemHouse extends StatelessWidget {
  const ItemHouse({
    @required this.house,
  });

  final HouseModel? house;

  @override
  Widget build(BuildContext context) {
    final arrPhotos = house!.photo!.split(',');
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.DETAIL, arguments: house),
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20.0,
          right: 20.0,
        ),
        child: Hero(
          tag: "key_${house!.photo}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: AspectRatio(
              aspectRatio: .90,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    arrPhotos[0],
                    fit: BoxFit.fill,
                  ),
                  _Location(location: house?.location ?? ""),
                  _DetailHouse(house: house ?? HouseModel()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({this.location});

  final String? location;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7.5,
        ),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/location.svg', width: 15),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                location ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: AppTheme.blueDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailHouse extends StatelessWidget {
  const _DetailHouse({@required this.house});

  final HouseModel? house;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Stack(
          //overflow: Overflow.visible,
          clipBehavior: Clip.none,
          children: [
            //Positioned(right: 15, top: -42.5, child: ButtonFavorite()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house!.name ?? "",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppTheme.blueDark, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundImage:
                              NetworkImage(house!.avatar ?? ""),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                house!.user ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: AppTheme.blueDark),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${house!.price!.toStringAsFixed(0)}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                              color: AppTheme.blueDark,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* RatingAndReviews(
                          rating: house.rating,
                          reviews: house.reviews,
                        ), */
                        //Facilities(house: house),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({
    this.reviews,
    @required this.rating,
  });

  final int? reviews;
  final int? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /*  Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                'assets/icons/star.svg',
                width: 15,
                color: (index < rating) ? AppTheme.cyan : Colors.black12,
              ),
            ),
          ),
        ), */
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            '$reviews opinions',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black26),
          ),
        ),
      ],
    );
  }
}