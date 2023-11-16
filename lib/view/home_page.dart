import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/main_controller.dart';
import 'package:new_project/model/food_model.dart';
import 'package:new_project/utils/app_colors.dart';
import 'package:new_project/utils/custom_widget/custom_text_form_field.dart';
import 'package:new_project/utils/custom_widget/primary_button.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodPriceController = TextEditingController();
  final TextEditingController foodQuantityController = TextEditingController();
  final TextEditingController foodImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('My App'),
        ),
        // drawer: Drawer(
        //   backgroundColor: Colors.white,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(25),
        //       bottomRight: Radius.circular(25),
        //     ),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(
        //               height: 20,
        //             ),
        //             CircleAvatar(
        //               backgroundImage: AssetImage('assets/images/avater.png'),
        //               radius: 50,
        //             ),
        //             SizedBox(
        //               height: 10,
        //             ),
        //             Text(
        //               'Alomgir Store',
        //               style: TextStyle(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black),
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Text(
        //               'Telia, Shibpur, Narsingdi',
        //               style: TextStyle(color: Colors.black),
        //             ),
        //             SizedBox(
        //               height: 30,
        //             ),
        //           ],
        //         ),
        //         ListTile(
        //           contentPadding: const EdgeInsets.only(left: 0),
        //           title: Text(
        //             'Profile',
        //             style: TextStyle(color: Colors.grey[700]),
        //           ),
        //           onTap: () {},
        //         ),
        //         Divider(
        //           endIndent: 50,
        //           color: Colors.blueGrey.shade100,
        //         ),
        //         ListTile(
        //           contentPadding: const EdgeInsets.only(left: 0),
        //           title: Text(
        //             'Earning History',
        //             style: TextStyle(color: Colors.grey[700]),
        //           ),
        //           onTap: () {},
        //         ),
        //         Divider(
        //           endIndent: 50,
        //           color: Colors.blueGrey.shade100,
        //         ),
        //         ListTile(
        //           contentPadding: const EdgeInsets.only(left: 0),
        //           title: Text(
        //             'Transaction History',
        //             style: TextStyle(color: Colors.grey[700]),
        //           ),
        //           onTap: () {},
        //         ),
        //         Divider(
        //           endIndent: 50,
        //           color: Colors.blueGrey.shade100,
        //         ),
        //         ListTile(
        //           contentPadding: const EdgeInsets.only(left: 0),
        //           title: Text(
        //             'Settings',
        //             style: TextStyle(color: Colors.grey[700]),
        //           ),
        //           onTap: () {},
        //         ),
        //         Expanded(
        //           child: Align(
        //             alignment: Alignment.bottomLeft,
        //             child: Row(
        //               children: [
        //                 Text('LOGOUT',
        //                     style: TextStyle(
        //                         color: Colors.indigo.shade400,
        //                         letterSpacing: 2,
        //                         fontSize: 17,
        //                         fontWeight: FontWeight.bold)),
        //                 const SizedBox(
        //                   width: 15,
        //                 ),
        //                 Icon(
        //                   Icons.arrow_forward,
        //                   size: 17,
        //                   color: Colors.indigo.shade400,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: GetBuilder<MainController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //add to food item here
                if (controller.isClient.value)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add food item here",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              txtController: foodNameController,
                              labeltxt: "Food Name",
                              hintText: "Enter food name",
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: CustomTextField(
                              txtController: foodPriceController,
                              labeltxt: "Price",
                              hintText: "Enter price",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              txtController: foodQuantityController,
                              labeltxt: "Quantity",
                              hintText: "Enter quantity",
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: ListenableBuilder(
                              listenable: foodImageController,
                              builder: (context, child) => InkWell(
                                onTap: () {
                                  controller.pickedImage();
                                  foodImageController.text =
                                      controller.image!.path.split('/').last;
                                  print(controller.image!.path);
                                },
                                child: AbsorbPointer(
                                  child: CustomTextField(
                                    txtController: foodImageController,
                                    labeltxt: "Image",
                                    hintText: "Enter image",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PrimaryBtn(
                        title: "Add Food",
                        onPressed: () {
                          foodList.add(FoodModel(
                              foodNameController.text,
                              int.parse(foodQuantityController.text),
                              foodPriceController.text,
                              foodImageController.text));
                          Get.snackbar(
                            "Food Added Successfully",
                            '',
                            messageText: Container(),
                            colorText: Colors.white,
                            backgroundColor: Colors.green,
                            snackPosition: SnackPosition.BOTTOM,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            margin: const EdgeInsets.only(
                                bottom: 20, left: 20, right: 20),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                Text(
                    controller.isClient.value
                        ? 'Ordered Meals'
                        : 'Available Meals',
                    style: Theme.of(context).textTheme.titleLarge),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.sp),
                    itemCount: controller.isClient.value
                        ? cartList.length
                        : foodList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          controller.isClient.value
                                              ? cartList[index].image
                                              : foodList[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.isClient.value
                                          ? cartList[index].name
                                          : foodList[index].name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Ksh ',
                                          style: TextStyle(
                                              color: AppColors.redColor,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: controller.isClient.value
                                              ? cartList[index].price
                                              : foodList[index].price,
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ])),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        if (!controller.isClient.value)
                                          InkWell(
                                            onTap: () {
                                              if (foodList[index].quantity >
                                                  1) {
                                                controller
                                                    .decreaseQuantity(index);
                                              }
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.grey[300],
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        if (controller.isClient.value)
                                          const Text("Quantity: ",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          controller.isClient.value
                                              ? cartList[index]
                                                  .quantity
                                                  .toString()
                                              : foodList[index]
                                                  .quantity
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        if (!controller.isClient.value)
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .increaseQuantity(index);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.grey[300],
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            if (!controller.isClient.value)
                              Positioned(
                                top: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    cartList.add(foodList[index]);
                                    Get.snackbar(
                                      "Food Added Successfully",
                                      '',
                                      duration: const Duration(seconds: 1),
                                      messageText: Container(),
                                      colorText: Colors.white,
                                      backgroundColor: Colors.green,
                                      snackPosition: SnackPosition.BOTTOM,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      margin: const EdgeInsets.only(
                                          bottom: 20, left: 20, right: 20),
                                    );
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300],
                                    ),
                                    child: const Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 20,
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
