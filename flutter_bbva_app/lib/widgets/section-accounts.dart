import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';
import 'package:flutter_bbva_app/widgets/account-list.dart';

class SectionAccounts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          child: Container(
            padding: EdgeInsets.all(25.0),
            child:  Column(
              children: [
                Row(
                  children: [
                    Text("TUS CUENTAS",
                      style: TextStyle(fontSize: 16.0, color: AppTheme.kBackground, fontWeight: FontWeight.bold)),
                    Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.more_horiz, color: AppTheme.kBlueLigth,),
                        )
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                    height: 120.0,
                    child:
                    AccountList(
                      accounts: [
                        AccountModel(idAccount: "001ah7297", numberAccount: "37265", total: "20,000",),
                        AccountModel(idAccount: "001ah7246", numberAccount: "36264", total: "158,000",),
                      ],
                    )
                )

              ],
            ),
          )

      ),
    );
  }

}