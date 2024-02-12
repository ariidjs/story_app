import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/values/constants.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            '${Constants.imgPath}img_no_data.png',
            width: 200,
            height: 200,
          ),
        ),
        Text('No Data', style: largeBoldTextStyles)
      ],
    );
  }
}
