import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{

  PrimaryButton({
    required this.text,
    required this.onPressed,
    this.size
  });
  final String text;
  final void Function() onPressed;
  final Size? size;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),

      style: ElevatedButton.styleFrom(
        minimumSize: size != null ? size : Size(double.infinity, 40.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        //backgroundColor: AppTheme.primaryDark2,
        onPrimary: Colors.white,
        primary: AppTheme.primaryDark2,
        textStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }


}