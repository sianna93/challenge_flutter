import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputFieldCustom extends StatelessWidget{

  bool? showPrefixIcon;
  IconData? iconPrefix;
  Color? colorPrefix ;
  bool? showSuffixIcon;
  IconData? iconSuffix;
  Color? colorSuffix;
  bool? obscureText;
  String? hintText;
  final TextEditingController? controller;


  InputFieldCustom({this.showPrefixIcon = false ,
    this.iconPrefix,
    this.colorPrefix,
    this.showSuffixIcon = false,
    this.iconSuffix,
    this.colorSuffix,
    this.obscureText = false,
    this.hintText = '',
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //width: double.infinity,
      //height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      child: Row(
        children: [
          Container(
            child: Row(
              children: showPrefixIcon ?? false ? [
                Icon(
                  iconPrefix,
                  color: colorPrefix ?? AppTheme.background,
                  size: 30.0,
                ),
                SizedBox(width: 10.0)
              ] : [],
            )
          ),

          Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.black87, fontSize: 18.0),
                cursorColor: AppTheme.background,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
                    focusColor: AppTheme.background,
                    hoverColor: AppTheme.background,
                    hintText: hintText,
                    hintStyle:  TextStyle(color: Colors.black54, fontSize: 16.0),
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none
                ),
                obscureText: obscureText ?? false,
              ),
          ),
          Container(
              child: Row(
                children: showSuffixIcon ?? false ? [
                  SizedBox(width: 10.0),
                  Icon(
                    iconSuffix,
                    color: colorSuffix ?? AppTheme.background,
                    size: 30.0,
                  ),

                ] : [],
              )
          ),

        ],
      )
    );
  }

}