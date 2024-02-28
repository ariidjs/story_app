import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_colors.dart';

TextStyle normalTextStyles = const TextStyle(fontSize: 16);
TextStyle normalBoldTextStyles =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle smallBoldTextStyles =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
TextStyle smallTextStyles = const TextStyle(fontSize: 14);
TextStyle largeTextStyles = const TextStyle(fontSize: 20);
TextStyle largeBoldTextStyles =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

TextStyle titleTextStyle = const TextStyle(
    fontFamily: 'Lobster', fontSize: 24, fontWeight: FontWeight.bold);

ButtonStyle primaryBtn = ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorOnPrimary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
ButtonStyle disabledPrimaryBtn = ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorOnPrimary.withOpacity(0.4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
