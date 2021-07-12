import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
          // width: double.infinity,
          // height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Image(
                  width: double.infinity,
                  //height: 300.0,
                  image: AssetImage("assets/ford-ferrari.jpeg")
              ),
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Frerrari vs Ford",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                      )
                                  ),
                                  Text("Una hermosa historia",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey
                                    ),
                                  ),

                                ],
                              ),

                            ),

                            Row(
                                children: [
                                  Icon(
                                      Icons.star,
                                      size: 30.0,
                                      color: Colors.amber
                                  ),
                                  Text("41",
                                      style: TextStyle(color: Colors.grey, fontSize: 22.0)
                                  ),
                                ]
                            )

                          ]
                      ),

                      Container(
                        //color: Colors.red,
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _iconButton(Icons.call, "CALL"),
                            _iconButton(Icons.near_me, "ROUTE"),
                            _iconButton(Icons.share, "SHARE"),

                          ],
                        )
                      ),

                      Text(
                            "En 1963, el vicepresidente de Ford Motor Company, Lee Iacocca (Jon Bernthal), le propone a Henry Ford II (Tracy Letts) comprar Ferrari con poco dinero como medio para aumentar sus ventas de automóviles al participar en las 24 Horas de Le Mans. Sin embargo, Enzo Ferrari (Remo Girone), utiliza la oferta de Ford para asegurar un acuerdo más lucrativo con Fiat que le permite conservar la propiedad completa de la Scuderia Ferrari. Al rechazar el acuerdo propuesto con Ford, Enzo también insulta intencionalmente tanto a Ford como a Henry II.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18.0),
                          )
                    ],
                  )
              ),
            ],
          )
      )

    );
  }

  Widget _iconButton(IconData iconData, String iconName ) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(iconData, color: Colors.blue),
          SizedBox(height: 10.0,),
          Text(iconName)
        ],
      )
    );


  }

}