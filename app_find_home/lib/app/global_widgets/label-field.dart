import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LabelField extends StatelessWidget{

  final String label;

  LabelField({required this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.primaryDark2,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),

      ],
    );
  }

}