import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: [
        Bubble(
          title: AppLocalizations.of(Get.context!)!.camera,
          iconColor: AppColors.colorWhite,
          bubbleColor: AppColors.colorOnPrimary,
          icon: Icons.camera_alt,
          titleStyle: normalBoldTextStyles,
          onPress: () async {
            final pickedFile =
                await _picker.pickImage(source: ImageSource.camera);
            pickedFile != null ? routeToPreview(pickedFile) : null;
          },
        ),
        Bubble(
          title: AppLocalizations.of(Get.context!)!.gallery,
          iconColor: AppColors.colorWhite,
          bubbleColor: AppColors.colorOnPrimary,
          icon: Icons.photo,
          titleStyle: normalBoldTextStyles,
          onPress: () async {
            final pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
            pickedFile != null ? routeToPreview(pickedFile) : null;
          },
        ),
      ],
      animation: _animation,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: AppColors.colorPrimary,
      iconData: Icons.add,
      backGroundColor: Colors.white,
    );
  }

  void routeToPreview(XFile file) {
    context.goNamed('preview', queryParameters: {'photo_path': file.path});
  }
}
