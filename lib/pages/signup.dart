import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/controllers/signup_controller.dart';
import 'package:instagram/extensions/center.dart';
import 'package:instagram/extensions/layout.dart';
import 'package:instagram/models/user_model.dart';

class SignupPage extends GetResponsiveView<SignupController> {
  SignupPage({super.key}) {
    Get.put(SignupController());
  }


  @override
  Widget phone() {
    return Scaffold(
      body: SizedBox(
        width: screen.width,
        height: screen.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("signup Page", style: GoogleFonts.satisfy(fontSize: 50,color: Colors.pink))
                .marginOnly(bottom: 50),
            TextField(
              controller: controller.userInCtl,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person_2 , color: Colors.pinkAccent),
                  labelText: "username",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
            ).Size(width: 300).marginOnly(bottom: 20),
            TextField(
              controller: controller.emailInCtl,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email, color: Colors.pinkAccent),
                  labelText: "email",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
            ).Size(width: 300).marginOnly(bottom: 20),
            Obx(
                  () =>
                  TextField(
                    controller: controller.passInCtl,
                    obscureText: controller.Visibility.value,
                    decoration: InputDecoration(
                        labelText: "password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.5)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.5, color: Colors
                              .white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () =>
                            controller.Visibility.value =
                            !controller.Visibility.value,
                            icon: Icon(controller.Visibility.value
                                ? Icons.visibility_off
                                : Icons.visibility), color: Colors.pinkAccent)),
                  ),
            ).Size(width: 300).marginOnly(bottom: 50),
            ElevatedButton(
                onPressed: () {
                  final res = Get.find<AppController>().signup(User(
                      user: controller.userInCtl.text,
                      password: controller.passInCtl.text,
                      email: controller.emailInCtl.text));

                  controller.userInCtl.clear();
                  controller.emailInCtl.clear();
                  controller.passInCtl.clear();


                  if(res){
                    Get.toNamed("/signin");
                  }
                },
                child: Text("sign up" ),
                    style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    primary: Colors.greenAccent.shade700))
                .Size(width: 200)
                .marginOnly(bottom: 10),
            ElevatedButton(
                onPressed: () => Get.back(),
                child: Text("Back"),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    primary: Colors.greenAccent.shade700))
                .Size(width: 200)
          ],
        ).center(),
      ),
      backgroundColor: Color(0Xff6A5495),
    );
  }
}
