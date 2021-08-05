import 'dart:ui';

import 'package:flutter/material.dart';

class PlayIconWidget extends StatelessWidget{

   double customWidth = 60.0;
   double customHeight = 60.0;

   PlayIconWidget({required this.customWidth, required this.customHeight});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: customWidth,
            height: customHeight,
            child:  ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color(0xFF82858c).withOpacity(0.4),
                      )
                  )
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child:  Icon(Icons.play_circle_filled, size: (customWidth * 36.0) / 60.0, color: Colors.white,),
        )

      ],
    );
  }

}