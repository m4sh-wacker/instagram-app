import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/extensions/center.dart';
import 'package:instagram/extensions/layout.dart';
import 'package:instagram/models/user_model.dart';

class ManagePage extends GetResponsiveView<AppController> {
  ManagePage({super.key});

  @override
  Widget phone() {
    controller.emailInCtl.text = controller.signedinUser!.email ?? "";
    controller.passInCtl.text = controller.signedinUser!.password ?? "";
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome Admin"),
          backgroundColor: Colors.pinkAccent.shade700),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("user :" + (controller.signedinUser!.user ?? ""),
                  style: GoogleFonts.abel(fontSize: 30))
              .marginOnly(bottom: 20),
          TextField(
            controller: controller.emailInCtl,
            decoration: InputDecoration(
                labelText: "email",
                suffixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()),
          ).Size(width: 300).marginOnly(bottom: 20),
          TextField(
            controller: controller.passInCtl,
            decoration: InputDecoration(
                labelText: "password",
                suffixIcon: Icon(Icons.password),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()),
          ).Size(width: 300).marginOnly(bottom: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                      onPressed: () {
                        Get.find<AppController>().upadmin(User(
                            password: controller.passInCtl.text,
                            email: controller.emailInCtl.text));

                        controller.emailInCtl.clear();
                        controller.passInCtl.clear();

                        controller.update();
                        Get.offAllNamed("/manage");
                      },
                      child: Text("Update"),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          primary: Colors.greenAccent.shade700))
                  .Size(width: 200)
                  .marginOnly(bottom: 15),
              ElevatedButton(
                      onPressed: () {
                        controller.deleteAccount(controller.signedinUser);
                        controller.signedinUser = null;
                        controller.update();
                        Get.offAllNamed("/admin");
                      },
                      child: Text("delete account"),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          primary: Colors.greenAccent.shade700))
                  .Size(width: 200)
                  .marginOnly(bottom: 20, left: 20),
            ],
          ),
          ElevatedButton(
                  onPressed: () => Get.toNamed("/admin"),
                  child: Text("back"),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      primary: Colors.greenAccent.shade700))
              .Size(width: 200)
        ],
      ).center(),
      backgroundColor: Color(0Xff6A5495),
    ).Size(width: screen.width, height: screen.height);
  }
}
