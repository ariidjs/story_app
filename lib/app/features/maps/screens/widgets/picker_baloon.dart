import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';

class PickerBaloon extends StatelessWidget {
  final Function() onPick;
  final String address;
  const PickerBaloon({super.key, required this.onPick, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset.zero)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                address,
                style: normalBoldTextStyles,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                  onPressed: () => onPick(),
                  style: primaryBtn,
                  label: Text(
                    AppLocalizations.of(context)!.chooseArea,
                    style:
                        normalTextStyles.copyWith(color: AppColors.colorWhite),
                  ),
                  icon: const Icon(
                    Icons.check,
                    color: AppColors.colorGreen,
                  ))
            ],
          ),
        ));
  }
}
