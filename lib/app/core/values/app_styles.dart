import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_colors.dart';

TextStyle normalTextStyles =
    const TextStyle(fontFamily: 'EBGaramond', fontSize: 16);
TextStyle normalBoldTextStyles = const TextStyle(
    fontFamily: 'EBGaramond', fontSize: 16, fontWeight: FontWeight.bold);
TextStyle smallBoldTextStyles = const TextStyle(
    fontFamily: 'EBGaramond', fontSize: 14, fontWeight: FontWeight.bold);
TextStyle smallTextStyles =
    const TextStyle(fontFamily: 'EBGaramond', fontSize: 14);
TextStyle largeTextStyles =
    const TextStyle(fontFamily: 'EBGaramond', fontSize: 20);
TextStyle largeBoldTextStyles = const TextStyle(
    fontFamily: 'EBGaramond', fontSize: 20, fontWeight: FontWeight.bold);

ButtonStyle primaryBtn = ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorOnPrimary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
ButtonStyle disabledPrimaryBtn = ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorOnPrimary.withOpacity(0.4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
