import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_getx/Controllers/login_controllers.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyLoginScreen extends StatelessWidget {
  MyLoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: Form(
          key: loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: loginController.passwordController.value,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.password),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    loginController.loginApi();
                  },
                  child: loginController.loading.value
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          // LoadingAnimationwidget that call the
                          color: Colors.blue, // staggereddotwave animation
                          size: 50,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 45,
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
