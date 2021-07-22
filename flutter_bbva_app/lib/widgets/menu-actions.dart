import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';

class MenuActions extends StatelessWidget{
  final List<OptionModel> options;

  MenuActions({required this.options});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 140.0,
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: options.length,
          padding: EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index){
            return ActionItem(option: options[index]);
          }
      ),
    );
  }

}

class ActionItem extends StatelessWidget{

  final OptionModel option;

  ActionItem({required this.option});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: this.option.color,
              radius: 35.0,
              child: Icon(this.option.icon, color: Colors.white, size: 40.0,),
            ),
            SizedBox(height: 12.0,),
            Text(this.option.option, style: TextStyle(fontSize: 11.0, color: AppTheme.kDark),)
          ],
      ),
    );
  }
}

class OptionModel {
  IconData icon;
  Color color;
  String option;

  OptionModel({required this.icon, required this.color, required this.option});


}