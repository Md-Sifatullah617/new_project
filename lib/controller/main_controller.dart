import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/model/food_model.dart';

class MainController extends GetxController {
  var isClient = false.obs;
  File? image;

  changeUser() {
    isClient.value = !isClient.value;
  }

  increaseQuantity(int index) {
    foodList[index].quantity++;
    update();
  }

  decreaseQuantity(int index) {
    foodList[index].quantity--;
    update();
  }

  void pickedImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }
}
