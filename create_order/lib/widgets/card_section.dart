
import 'package:create_order/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardSection extends StatefulWidget {
  List<OptionModel> options = [];
  CardSection({required this.options});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardSectionState();
  }
}

class CardSectionState extends State<CardSection>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
                for ( var option in widget.options )
                  _customCheckbox(isChecked: option.isChecked, textValue: option.text, additional: option.additional)

              /*_customCheckbox(isChecked: true, textValue: "Public"),
              _customCheckbox(isChecked: false, textValue: "Private")*/
            ],
          ),
        )
    );
  }

  Widget _customCheckbox({isChecked, textValue: String, additional: String}) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 6.0, top: 6.0),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 6.0, left: 8.0, right: 8.0),
                child:
                // if (isChecked == true)
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: !isChecked ? LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [AppTheme.kGray1, AppTheme.kGray2],
                    ) : RadialGradient(
                      radius: 0.23,
                      center: Alignment.center,
                      /*center: Alignment(0.7, -0.6), // near the top right
                      radius: 0.2,
                      stops: <double>[0.4, 1.0],*/
                      colors: [Colors.white, Colors.white, AppTheme.kGreen],
                    )
                  ),
                ),

                /*ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: isChecked ? [AppTheme.kGreen, AppTheme.kGreen] : [AppTheme.kGray1, AppTheme.kGray2],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds),
                    child: Icon(isChecked ?  Icons.adjust : Icons.circle, color: Colors.white)
                )*/
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 10.0),
                //width: double.infinity,
                  //width: 300.0,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppTheme.kGrayLine,
                              width: 1.0
                          )
                      )
                  ),
                  child: Container(

                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Text(
                            textValue,
                            style: TextStyle(color: isChecked ? AppTheme.kGreen : Colors.black, fontSize: 16.0),

                          ),
                          Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Text(additional, textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16.0
                                  ),
                                ),
                              )
                          )
                        ],
                      )

                  )

              ),
            )



          ],
        )
    );
  }

}

class OptionModel{
   bool isChecked;
   String text;
   String additional = "";

   OptionModel({required this.isChecked, required this.text, String? additional}){
     this.additional = additional ?? "";
   }


}