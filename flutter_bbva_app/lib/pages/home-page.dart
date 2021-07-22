import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';
import 'package:flutter_bbva_app/widgets/menu-actions.dart';
import 'package:flutter_bbva_app/widgets/section-accounts.dart';
import 'package:flutter_bbva_app/widgets/section-cards.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.kBackground,
        elevation: 0,
        leading: Padding(padding: EdgeInsets.only(left: 30.0), child: Image(image: AssetImage("assets/icon-open-menu-white.png")),) ,//
        title: Text("Hola, Mauricio", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: CircleAvatar(
                radius: 19.5,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                    child: Image(image: AssetImage("assets/user.png")),
                    radius: 18.0,
                  )
              )
          ),
        ],
      ),
      body: Stack(
        children: [
          BackgroundWidget(),
          Container(
            // height: 100.0,
            child: Column(
              children: [
                SectionAccounts(),
                MenuActions(options: [
                  OptionModel(icon: Icons.add, color: AppTheme.kOrangeOpt, option: "Oportunidades"),
                  OptionModel(icon: Icons.compare_arrows, color: AppTheme.kBlueOpt, option: "Transferir"),
                  OptionModel(icon: Icons.attach_money, color: AppTheme.kGreenOpt, option: "Retiro sin tarjeta"),
                  OptionModel(icon: Icons.settings, color: AppTheme.kPurpleOpt, option: "Pagar servicio"),
                ]),
                SizedBox(height: 20.0,),
                SectionCards()
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NavigationButton(isSelected: true, icon: Icons.keyboard_capslock_outlined,),
                    NavigationButton(isSelected: false, icon: Icons.favorite_border),
                    NavigationButton(isSelected: false, icon: Icons.add_circle_outline),
                    NavigationButton(isSelected: false, icon: Icons.email_outlined),
                  ],
                ),
              )
            ),
          )


        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppTheme.kBackground,
          height: 120.0,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: AppTheme.kBackgroundLigth,
            // height: 120.0,
          ),
        )
      ],
    );
  }

}

class NavigationButton extends StatelessWidget{

  final bool isSelected;
  final IconData icon;

  NavigationButton({required this.isSelected, required this.icon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      alignment: Alignment.center,
      width: (MediaQuery.of(context).size.width - 24)/4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: isSelected ? AppTheme.kBackground : AppTheme.kBlueLigth, size: 35.0,),
          if (isSelected == true)
            Icon(Icons.circle, color: AppTheme.kBackground, size: 9.0,),
        ],
      ),
    );
  }

}

