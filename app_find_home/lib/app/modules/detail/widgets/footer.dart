import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:app_find_home/app/data/model/reservation_model.dart';
import 'package:app_find_home/app/global_widgets/input-field.dart';
import 'package:app_find_home/app/global_widgets/primary_button.dart';
import 'package:app_find_home/app/modules/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {

  @override
  FooterState createState() => FooterState();

  Footer({
    required this.house,
  });
  final HouseModel house;
}

class FooterState extends State<Footer>{
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _dateController.dispose();
    _priceController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$${widget.house.price} usd",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppTheme.blueDark, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () => _settingModalBottomSheet(context),
              child: Container(
                width: 170.0,
                height: 45.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.cyan,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  "Reserved Now!",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>
            GetBuilder<DetailController>(
                builder: (_) =>
                    Container(
                      height: 400.0,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: AppTheme.background_white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () =>
                              {
                              },
                              child: Container(
                                width: 80.0,
                                height: 10.0,
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Reservar",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                              color: AppTheme.blueDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.calendar_today_outlined,
                            hintText: "Date",
                            controller: _dateController,
                          ),

                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.monetization_on,
                            hintText: "Price",
                            controller: _priceController,
                          ),
                          SizedBox(height: 30.0,),
                          PrimaryButton(
                            text: "Save",
                            onPressed: () {
                              _.register(reservationModel: ReservationModel(
                                idHouse: widget.house.idHouse,
                                date: DateTime.parse(_dateController.text),
                                price: double.parse(_priceController.text)
                                // widget.house.idHouse
                              ));
                            },
                          ),
                        ],
                      ),
                    )
            )
      );
  }
}