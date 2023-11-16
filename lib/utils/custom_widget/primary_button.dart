import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/utils/app_colors.dart';

class PrimaryBtn extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const PrimaryBtn({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        minimumSize: Size(Get.width, Get.height * 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
    );
  }
}
