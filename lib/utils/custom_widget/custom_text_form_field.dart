import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final bool? isCountryPicker;
  final TextEditingController? txtController;
  final String hintText;
  final IconData? prefixIcon;
  final String labeltxt;
  final Widget? suffixWidget;
  final bool? obscureText;
  const CustomTextField(
      {super.key,
      this.txtController,
      required this.hintText,
      this.prefixIcon,
      required this.labeltxt,
      this.isCountryPicker,
      this.suffixWidget,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtController,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
              ),
        suffixIcon: suffixWidget,
        label: Text(
          labeltxt,
          style: Get.textTheme.bodyLarge!.copyWith(fontSize: 15),
        ),
        hintText: hintText,
        hintStyle: Get.textTheme.bodyLarge!.copyWith(fontSize: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: AppColors.fadeBlue,
        filled: true,
      ),
    );
  }
}
