import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/language_controller.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';

class LangWidget extends StatefulWidget {
  const LangWidget({super.key});

  @override
  State<LangWidget> createState() => _LangWidgetState();
}

class _LangWidgetState extends State<LangWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = injector.get<LanguageController>();
    controller.getLang();
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.chooseLang,
              style: normalBoldTextStyles,
            ),
            const SizedBox(
              height: 8.0,
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.en,
                style: normalTextStyles.copyWith(color: AppColors.colorBlack),
              ),
              leading: CountryFlag.fromCountryCode(
                'GB',
                height: 24,
                width: 24,
              ),
              trailing: controller.currentLang == 'en'
                  ? const Icon(Icons.check, color: AppColors.colorGreen)
                  : null,
              onTap: () => controller.setLang('en'),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.id,
                style: normalTextStyles.copyWith(color: AppColors.colorBlack),
              ),
              leading: CountryFlag.fromCountryCode(
                'ID',
                height: 24,
                width: 24,
              ),
              trailing: controller.currentLang == 'id'
                  ? const Icon(Icons.check, color: AppColors.colorGreen)
                  : null,
              onTap: () => controller.setLang('id'),
            )
          ],
        ),
      ),
    );
  }
}
