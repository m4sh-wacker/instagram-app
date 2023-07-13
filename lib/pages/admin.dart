import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instagram/controllers/admin_controller.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/extensions/center.dart';
import 'package:instagram/extensions/layout.dart';
import 'package:instagram/models/user_model.dart';


class AdminPage extends GetResponsiveView<AdminPageController> {
  AdminPage({super.key}) {
    Get.put(AdminPageController());
  }


  @override
  Widget phone() {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Admin"),backgroundColor: Colors.pinkAccent.shade700),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller.userInCtl,
            decoration: InputDecoration(
                labelText: "user or email",suffixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()),
          ).Size(width: 300).marginOnly(bottom: 50),

          ElevatedButton(
              onPressed: () {
                final res = Get.find<AppController>().search(User(
                    user: controller.userInCtl.text));
                controller.userInCtl.clear();

                if (res) {
                  Get.toNamed("/manage");
                }
              },
              child: Text("search"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  primary: Colors.greenAccent.shade700))
              .Size(width: 200).Size(width: 200).marginOnly(bottom: 10),

          ElevatedButton(
              onPressed: () => Get.offAllNamed("/signin"),
              child: Text("sign out"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  primary: Colors.greenAccent.shade700))
              .Size(width: 200)
        ],
      ).center() ,
      backgroundColor: Color(0Xff6A5495),
    );
  }
}
