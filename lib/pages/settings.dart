import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/extensions/center.dart';
import 'package:instagram/extensions/layout.dart';
import 'package:instagram/models/user_model.dart';

class SetingsPage extends GetResponsiveView<AppController> {
  SetingsPage({super.key}) {}

  @override
  Widget phone() {
    controller.userInCtl.text = controller.signedinUser!.user ?? "";
    controller.emailInCtl.text = controller.signedinUser!.email ?? "";
    controller.passInCtl.text = controller.signedinUser!.password ?? "";
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller.userInCtl,
            decoration: InputDecoration(
                labelText: "user",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()),
          ).Size(width: 300).marginOnly(bottom: 20),
          TextField(
            controller: controller.emailInCtl,
            decoration: InputDecoration(
                labelText: "email",
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
                labelText: "Password",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()),
          ).Size(width: 300).marginOnly(bottom: 20),
          ElevatedButton(
                  onPressed: () {
                    Get.find<AppController>().upuser(User(
                        user: controller.userInCtl.text,
                        password: controller.passInCtl.text,
                        email: controller.emailInCtl.text));

                    controller.userInCtl.clear();
                    controller.emailInCtl.clear();
                    controller.passInCtl.clear();

                    controller.update();
                    Get.offAllNamed("/setings");
                  },
                  child: Text("Update"),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      primary: Colors.greenAccent.shade700))
              .Size(width: 250)
              .marginOnly(bottom: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                      onPressed: () {
                        controller.signedinUser = null;
                        controller.update();
                        Get.offAllNamed("/signin");
                      },
                      child: Text("sign Out"),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          primary: Colors.greenAccent.shade700))
                  .Size(width: 200)
                  .marginOnly(bottom: 20),
              ElevatedButton(
                      onPressed: () {
                        controller.deleteAccount(controller.signedinUser);
                        controller.signedinUser = null;
                        controller.update();
                        Get.offAllNamed("/");
                      },
                      child: Text("delete account"),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          primary: Colors.greenAccent.shade700))
                  .Size(width: 200)
                  .marginOnly(bottom: 20, left: 20),
            ],
          ).marginOnly(top: 10)
        ],
      ).center(),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.orange.shade300, items: [
        BottomNavigationBarItem(
            icon: IconButton(
                iconSize: 50,
                onPressed: () => Get.toNamed("/pages"),
                icon: Icon(Icons.home),
                color: Colors.pinkAccent.shade700),
            label: "home"),
        BottomNavigationBarItem(
            icon: IconButton(
                iconSize: 50,
                onPressed: () => Get.toNamed("/"),
                icon: Icon(Icons.person),
                color: Colors.pinkAccent.shade700),
            label: "profile"),
        BottomNavigationBarItem(
            icon: IconButton(
                iconSize: 50,
                onPressed: () => Get.toNamed("/setings"),
                icon: Icon(Icons.settings),
                color: Colors.pinkAccent.shade700),
            label: "settings")
      ]),
      backgroundColor: Color(0Xff6A5495),
      appBar: AppBar(backgroundColor: Color(0Xff6A5495)),
    );
  }
}
