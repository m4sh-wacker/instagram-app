import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/controllers/pages_controller.dart';

class PagesPage extends GetResponsiveView<AppController> {
  PagesPage({Key? key}) : super(key: key) {
    Get.put(PagesPageController());
  }

  @override
  Widget phone() {
    final userList = controller.users
        .where((user) => user != controller.signedinUser)
        .toList();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => Get.toNamed("/"),
              child: Text(
                controller.signedinUser!.user.toString(),
                style: TextStyle(color: Colors.pinkAccent.shade400,fontSize: 40),
              )),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 10,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    leading: Text(
                      '${index + 1}-',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange.shade400,
                      ),
                    ),
                    subtitle: Text(
                      user.user!,
                      style: TextStyle(fontSize: 25, color: Colors.white60),
                    ).marginOnly(left: 20, bottom: 20, top: 20),
                    trailing: IconButton(
                      onPressed: () {
                        controller.addfollowUser(user);
                      },
                      icon: Obx(
                        () => Icon(
                          Icons.favorite,
                          color: controller.signedinUser!.followingUsers
                                  .contains(user)
                              ? Colors.pinkAccent
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Color(0Xff6A5495),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange.shade300,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 50,
              onPressed: () => Get.toNamed("/pages"),
              icon: Icon(Icons.home),
              color: Colors.pinkAccent.shade700,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 50,
              onPressed: () => Get.toNamed("/"),
              icon: Icon(Icons.person),
              color: Colors.pinkAccent.shade700,
            ),
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 50,
              onPressed: () => Get.toNamed("/setings"),
              icon: Icon(Icons.settings),
              color: Colors.pinkAccent.shade700,
            ),
            label: "settings",
          ),
        ],
      ),
      backgroundColor: Color(0Xff6A5495),
      appBar: AppBar(
        backgroundColor: Color(0Xff6A5495),
      ),
    );
  }
}
