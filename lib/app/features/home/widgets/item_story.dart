import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';

class ItemStory extends StatelessWidget {
  final Story item;
  const ItemStory({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/home/detail/${item.id}'),
      child: Container(
        color: AppColors.colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 12.0),
              child: Row(
                children: [
                  const SizedBox(
                    height: 36,
                    width: 36,
                    child: CircleAvatar(
                      backgroundColor: AppColors.colorOnPrimary,
                      child: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(item.name ?? '', style: normalBoldTextStyles)
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Image.network(
              item.photoUrl ?? '',
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: smallBoldTextStyles,
                    ),
                    const SizedBox(width: 4.0),
                    Expanded(
                      child: ReadMoreText(
                        item.description ?? '',
                        trimLines: 1,
                        textAlign: TextAlign.justify,
                        colorClickableText: AppColors.colorPrimary,
                        trimMode: TrimMode.Line,
                        trimCollapsedText:
                            AppLocalizations.of(Get.context!)!.showMore,
                        trimExpandedText:
                            AppLocalizations.of(Get.context!)!.showLess,
                        style: smallTextStyles,
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 16.0)
          ],
        ),
      ),
    );
  }
}
