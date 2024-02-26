import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:story_app/app/core/values/app_colors.dart';

class CustomButton extends StatefulWidget {
  final Function? onPressed;
  final String title;
  final ButtonState? state;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.state = ButtonState.idle,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
            text: widget.title,
            icon: const Icon(Icons.send, color: Colors.white),
            color: AppColors.colorOnPrimary),
        ButtonState.loading: const IconedButton(
          text: "Loading",
          color: AppColors.colorOnPrimary,
        ),
        ButtonState.fail: IconedButton(
            text: "Failed",
            icon: const Icon(Icons.cancel, color: Colors.white),
            color: Colors.red.shade300),
        ButtonState.success: IconedButton(
            text: "Success",
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            color: Colors.green.shade400)
      },
      onPressed: widget.onPressed,
      state: widget.state,
      progressIndicatorSize: 24.0,
    );
  }
}
