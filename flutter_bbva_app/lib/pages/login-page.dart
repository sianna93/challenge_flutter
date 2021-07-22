import 'package:flutter/material.dart';
import 'package:flutter_bbva_app/theme/app-theme.dart';
import 'package:flutter_bbva_app/widgets/pasword-field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(padding: EdgeInsets.only(left: 30.0), child: Image(image: AssetImage("assets/icon-open-menu.png")),) ,//
        title: Image(image: AssetImage("assets/BBVA_2019.png")),
      ),

      body: Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Row(
              children: [
                CircleAvatar(
                  child: Image(image: AssetImage("assets/user.png")),
                  radius: 45.0,
                ),
                SizedBox(width: 20.0,),
                CircleAvatar(
                  child: Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.compare_arrows)),
                  radius: 20.0,
                  backgroundColor: AppTheme.kBackground,
                )
              ],
            ),
            SizedBox(height: 30.0,),
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Hola, Mauricio",
                        style: TextStyle(color: AppTheme.kBackground, fontSize: 30.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
            ),
            SizedBox(height: 5.0,),
            Container(
            alignment: Alignment.centerLeft,
            child: Text("¿Qué tal tu día hoy?",
                      style: TextStyle(color: AppTheme.kBlueLigth, fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
            ),
            SizedBox(height: 30.0,),
            PasswordField(valueInitial: "pasword",),
            SizedBox(height: 30.0),
            Text("Olvidé mi contrasenña", style: TextStyle(color: AppTheme.kBackground, fontSize: 16.0)),
            Expanded(

              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginOption(icon: Icons.security, option: "Token Móvil"),
                    SizedBox(height: 40.0,),
                    LoginOption(icon: Icons.qr_code_scanner, option: "Operación\nQR + CoDi"),
                    SizedBox(height: 40.0,),
                    LoginOption(icon: Icons.call, option: "Línea BBVA"),
                  ],
                )
              ),
            ),
            Container(
              width: double.infinity,
              height: 6.0,
              color: AppTheme.kBackground
            )
          ],
        ),
      )

    );
  }

}

class LoginOption extends StatelessWidget {
  IconData icon;
  String option;

  LoginOption({required this.icon, required this.option});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Icon(this.icon, color: AppTheme.kBackground, size: 35.0,),
        SizedBox(width: 20.0,),
        Text(this.option, style: TextStyle(color: AppTheme.kBackground, fontSize: 16.0)),
      ],
    );
  }


}