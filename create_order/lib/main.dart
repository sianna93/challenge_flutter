import 'package:create_order/theme/app_theme.dart';
import 'package:create_order/utils/double-util.dart';
import 'package:create_order/widgets/card_section.dart';
import 'package:create_order/widgets/list_type_order.dart';
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

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }

}


class MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 2586.00;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.kBackground,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
            "Create an order",
          style: TextStyle(color: Colors.black),

        ),
      ),
      body: Container(
        color: AppTheme.kBackground,
        height: double.infinity,
        //padding: EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _titleSection(title: "Order Type", child: Container()),

                  CardSection(options: [
                    new OptionModel(isChecked: true, text: "Public"),
                    new OptionModel(isChecked: false, text: "Private"),
                  ]),

                  SizedBox(height: 10.0,),
                  _titleSection(title: "Active period", child: Container()),
                  CardSection(options: [
                    new OptionModel(isChecked: true, text: "3 days"),
                    new OptionModel(isChecked: false, text: "5 days", additional: "+\$2.00"),
                    new OptionModel(isChecked: false, text: "7 days", additional: "+\$3.00"),
                  ]),

                  SizedBox(height: 10.0,),
                  _titleSection(title: "Payment amount", child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 25.0),
                    child: Text("\$${roundDouble(_currentSliderValue, 2)}",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  )),
                  ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [AppTheme.kPurplelider, AppTheme.kBlueSlider, AppTheme.kBlue2Slider, AppTheme.kGreenSlider],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 3200,
                        activeColor: Colors.white,
                        //inactiveColor: Colors.grey,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      )
                  ),

                 ListTypeOrder(types: [
                    new TypeOrder(type: "Urgent order", description: "Highlighted order placed on top of the feed for one day", value: 5.00, isChecked: true),
                    new TypeOrder(type: "Anonymus order", description: "Your profile order is hidden and don't stay on the top", value: 10.00, isChecked: false),
                  ])
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dynamic_feed),
                    label: '',
                  ),
                ],
                currentIndex: 1,
                iconSize: 35.0,
                selectedItemColor: AppTheme.kGreen,
                unselectedItemColor: AppTheme.kGray2,
                onTap: (value) {},
              ),
            ),

            Positioned(
                left: (((MediaQuery.of(context).size.width) - 60) / 2),
                bottom: 70.0,
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topLeft,
                        begin: Alignment.bottomRight,
                        colors: [AppTheme.kPurplelider, AppTheme.kBlueSlider, AppTheme.kBlue2Slider, AppTheme.kGreenSlider],
                        tileMode: TileMode.mirror,
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30.0, ),
                )
            )

          ]
        )


      ),
    );
  }

  Widget _titleSection({title: String, child: Widget }) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        children: [
          SizedBox(width: 54.0,),
          Text(title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: child
          )
        ],
      ),
    );
  }


}
