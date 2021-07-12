

import 'package:create_order/theme/app_theme.dart';
import 'package:create_order/utils/double-util.dart';
import 'package:flutter/material.dart';

class ListTypeOrder extends StatelessWidget {
  List<TypeOrder>types = [];

  ListTypeOrder({required this.types});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        shrinkWrap: true,
        itemCount: types.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (BuildContext context, int index){
          return ItemTypeOrder(typeOrder: types[index]);
        }
    );
  }

}



class ItemTypeOrder extends StatefulWidget {
  TypeOrder typeOrder;

  ItemTypeOrder({required this.typeOrder});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ItemTypeOrderState(typeOrder: typeOrder);
  }
}


class ItemTypeOrderState extends State<ItemTypeOrder> {
  TypeOrder typeOrder;

  ItemTypeOrderState({required this.typeOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 54.0,),
                Text(typeOrder.type,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (typeOrder.isChecked == true)
                          Text("${typeOrder.value > 0 ? '+' : '-'}\$${roundDouble(typeOrder.value, 2)}", style: TextStyle(fontSize: 16.0),),
                        Switch(
                            value: typeOrder.isChecked,
                            activeColor: AppTheme.kGreen,
                            onChanged: (value){
                                setState(() {
                                  typeOrder.isChecked = !typeOrder.isChecked;
                                });
                            }
                            )
                      ],
                    )
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 54.0, right: 90.0),
              child: Text(typeOrder.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
            )


          ],
        )
    );
  }
}

class TypeOrder {
  String type;
  String description;
  double value;
  bool isChecked;

  TypeOrder({required this.type, required this.description, required this.value, required this.isChecked});


}