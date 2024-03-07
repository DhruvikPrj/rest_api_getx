import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:rest_api_getx/Screens/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;
  final formKey = GlobalKey<FormState>();

  void loginApi() async {
    loading.value = true;
    try {
      if (formKey.currentState?.validate() ?? false) {
        final response = await post(
          // patch,delete,get
          Uri.parse("http://192.168.1.31:4000/api/v1/user/login"),
          body: {
            "email": emailController.value.text,
            "password": passwordController.value.text,
          },
        );

        var data = jsonDecode(response.body);
        // print(response.statusCode);
        print(data);

        if (response.statusCode == 200) {
          loading.value = false;
          Get.showSnackbar(
            GetSnackBar(
              snackPosition: SnackPosition.TOP,
              borderRadius: 10.0,
              backgroundColor: Colors.transparent,
              barBlur: 15,
              titleText: Text(
                "Successful",
                style: TextStyle(
                  color: Colors.green.shade600,
                ),
              ),
              messageText: const Text(
                "You are login Successfully",
                style: TextStyle(color: Colors.black),
              ),
              duration: const Duration(seconds: 3),
            ),
          );

          Get.to(const HomeScreen());
        } else {
          print("not login");
          loading.value = false;
          // Get.showSnackbar(
          //   GetSnackBar(
          //     snackPosition: SnackPosition.TOP,
          //     borderRadius: 10.0,
          //     backgroundColor: Colors.transparent,
          //     barBlur: 15,
          //     titleText: Text(
          //       "Failed!",
          //       style: TextStyle(
          //         color: Colors.red.shade900,
          //       ),
          //     ),
          //     messageText: const Text(
          //       "Please Login With Valid Credentials",
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     duration: const Duration(seconds: 3),
          //   ),
          //)
        }
      }
    } catch (e) {
      loading.value = false;
      print(e.toString());

      //shwing snackbar
      Get.showSnackbar(
        GetSnackBar(
          snackPosition: SnackPosition.TOP,
          borderRadius: 10.0,
          backgroundColor: Colors.transparent,
          barBlur: 15,
          titleText: Text(
            "Failed!",
            style: TextStyle(
              color: Colors.red.shade900,
            ),
          ),
          messageText: const Text(
            "Please Login With Valid Credentials",
            style: TextStyle(color: Colors.black),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
