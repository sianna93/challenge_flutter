
import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';

class AccountList extends StatelessWidget {

  List<AccountModel>accounts = [];

  AccountList({required this.accounts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: accounts.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (BuildContext context, int index){
          return AccountItem(account: accounts[index]);
        }
    );
  }
}

class AccountItem extends StatelessWidget {

  AccountModel account;

  AccountItem({required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppTheme.kBlueLigth, width: 0.5))
      ),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${account.idAccount}", style: TextStyle(color: AppTheme.kBlueLigthPrimary, fontSize: 16.0),),
              Text("*${account.numberAccount}",
                textAlign: TextAlign.start,
                style: TextStyle(color: AppTheme.kBlueLigth, fontSize: 12.0),),
            ],
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("\$${account.total}", style: TextStyle(color: AppTheme.kBackground, fontSize: 20.0),),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Icon(Icons.arrow_forward_ios, color: AppTheme.kBlueLigth, size: 16.0,),
                  )
                ],

              )
          )
        ],
      ),
    );
  }


}

class AccountModel{
  final String idAccount;
  final String numberAccount;
  final String total;

  AccountModel({required this.idAccount, required this.numberAccount, required this.total});
}