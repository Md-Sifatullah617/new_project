import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/utils/app_colors.dart';
import 'package:new_project/view/login_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Easy Meals",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 50.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor),
        ),
        Container(
          height: 300.h,
          width: 300.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: const DecorationImage(
                  image: AssetImage('assets/images/sp.jpeg'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 70.h,
          width: 70.w,
          child: FloatingActionButton(
              onPressed: () {
                Get.offAll(() => LoginScreen());
              },
              backgroundColor: AppColors.mainColor,
              child: Icon(
                Icons.arrow_forward,
                size: 30.h,
                color: Colors.white,
              )),
        )
      ]),
    );
  }
}
