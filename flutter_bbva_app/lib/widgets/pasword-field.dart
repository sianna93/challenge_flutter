
import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';

class PasswordField extends StatelessWidget {

  final String valueInitial;
  PasswordField({required this.valueInitial});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        TextField(
          obscureText: true,
          cursorColor: AppTheme.kBackground,
          decoration: new InputDecoration(
            /*hintText: "Contraseña",*/
            labelText: "Contraseña",
            labelStyle: new TextStyle(color: AppTheme.kBackground, fontSize: 16.0),
            border: new UnderlineInputBorder(
                borderSide: new BorderSide(
                    color: AppTheme.kBackground
                )
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.kBackground),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.kBackground, width: 2.0),
            ),

          ),
          controller: TextEditingController(text: valueInitial),
          style: TextStyle(
              color: AppTheme.kBackground,
              fontSize: 18.0
          ),

        ),
        Positioned(
          top: 18.0,
          right: 0.0,
          child: IconButton(
            icon: Icon(Icons.visibility_off, color: AppTheme.kBackground,),
            onPressed: () {},),
        )
      ],
    );
  }

}