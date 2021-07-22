import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';

class CardList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 245.0,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreditCardWidget(numberCard: "62396", isWhite: false,),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card_outlined, color: AppTheme.kBackground, size: 20.0,),
                            SizedBox(width: 2.0,),
                            Text("Tarjeta digital", style: TextStyle(fontSize: 13.0, color: AppTheme.kBackground),),
                            SizedBox(width: 20.0,),
                            Text("Desactivar", style: TextStyle(fontSize: 13.0, color: AppTheme.kBackground),),
                            Transform.scale( scale: 0.7,
                              child: Switch(
                                  value: false,
                                  onChanged: (value){}
                                  )
                            )
                          ],
                        )
                      ),

                    ],
                  ),
                  Container(
                      transform: Matrix4.translationValues(-55.0, 0.0, 0.0),
                      child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(-90 / 360),
                          child: CreditCardWidget(numberCard: "62396", isWhite: true,)
                      )
                  )

                ],
              ),
            );
          }
      ),
    );
  }

}

class CreditCardWidget extends StatelessWidget {

  final String numberCard;
  final bool isWhite;

  CreditCardWidget({required this.numberCard,  required this.isWhite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: 240.0,
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: isWhite ? Colors.white : AppTheme.kBackground,
        boxShadow: [
          BoxShadow(
            color: AppTheme.kShadowGrey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(isWhite ? "assets/BBVA_2019.png" : "assets/BBVA_2019_white.png"),
            height: 17.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15.0),
          Image(
            image: AssetImage("assets/chip_card.png"),
            height: 18.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Text("*${numberCard}",
                style: TextStyle(
                    fontSize: 16.0,
                    //fontWeight: FontWeight.bold,
                    color: isWhite ?  AppTheme.kBackground : Colors.white
                ),
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image(
                      image: AssetImage(isWhite ? "assets/visa_azul_logo.png" : "assets/visa_blanco_logo.png"),
                      height: 16.0,
                      fit: BoxFit.cover,
                    ),
                  )
              )
            ],
          )

        ],
      ),
    );
  }

}