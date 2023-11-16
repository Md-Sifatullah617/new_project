import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/main_controller.dart';
import 'package:new_project/utils/custom_widget/custom_text_form_field.dart';
import 'package:new_project/utils/custom_widget/primary_button.dart';
import 'package:new_project/view/home_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              controller.isClient.value ? "Admin Login" : "Client Login",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 20.h,
            ),
            // enter name and phone number
            controller.isClient.value
                ? const CustomTextField(
                    labeltxt: "Username",
                    hintText: "Enter @username",
                  )
                : const CustomTextField(
                    labeltxt: "Your Name",
                    hintText: "Enter your name",
                  ),
            SizedBox(
              height: 20.h,
            ),
            controller.isClient.value
                ? const CustomTextField(
                    labeltxt: "Password",
                    hintText: "Enter your password",
                  )
                : const CustomTextField(
                    labeltxt: "Phone Number",
                    hintText: "Enter your phone number",
                  ),
            SizedBox(
              height: 20.h,
            ),
            PrimaryBtn(
              title: "Login",
              onPressed: () {
                Get.to(() => MyHomePage());
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () {
                controller.changeUser();
              },
              child: Text("Login as an Admin",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )),
            ),
            SizedBox(
              height: 20.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Powered by ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: 'TMT-Soft',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
