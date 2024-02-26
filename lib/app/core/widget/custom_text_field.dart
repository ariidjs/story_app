import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';

class CustomFormField extends StatefulWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final int? maxLines;
  final bool readOnly;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;

  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = false,
    this.keyboardType,
    this.onFieldSubmitted,
    this.maxLength,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.readOnly = false,
    this.onEditingComplete,
    this.prefixIcon,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowTitle)
          Text(
            widget.title,
            style: normalTextStyles.copyWith(fontSize: 14),
          ),
        if (widget.isShowTitle) const SizedBox(height: 4),
        TextFormField(
          onEditingComplete: widget.onEditingComplete,
          validator: widget.validator,
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction:
              widget.obscureText ? TextInputAction.go : TextInputAction.next,
          cursorColor: AppColors.colorOnPrimary,
          autovalidateMode: AutovalidateMode.always,
          obscureText: widget.obscureText ? !isShowPassword : false,
          style: normalTextStyles.copyWith(fontSize: 16),
          decoration: InputDecoration(
            counterText: '',
            hintText: !widget.isShowTitle ? widget.title : null,
            hintStyle: normalTextStyles.copyWith(
                fontSize: 14, color: AppColors.colorGrey),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: isShowPassword
                        ? const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.colorOnPrimary,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.colorOnPrimary,
                          ),
                    onPressed: () {
                      setState(() => isShowPassword = !isShowPassword);
                    },
                  )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.lightGreyColor)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.colorPrimary),
            ),
            contentPadding: const EdgeInsets.all(12),
            filled: widget.isShowTitle ? false : true,
            fillColor: !widget.isShowTitle ? AppColors.colorWhite : null,
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ],
    );
  }
}
