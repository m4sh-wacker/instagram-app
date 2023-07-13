import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/extensions/layout.dart';
import 'package:instagram/extensions/center.dart';
import 'package:instagram/models/user_model.dart';

class HomePage extends GetResponsiveView<AppController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget phone() {
    final AppController controller = Get.find();
    return Scaffold(
      bottomNavigationBar: controller.signedinUser == null
          ? null
          : BottomNavigationBar(
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
      appBar: controller.signedinUser == null
          ? null
          : AppBar(
              title: Text(""),
              backgroundColor: Color(0Xff6A5495),
            ),
      body: controller.signedinUser == null
          ? SizedBox(
              width: screen.width,
              height: screen.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Home Page",
                    style: GoogleFonts.satisfy(
                      fontSize: 60,
                      color: Colors.pinkAccent,
                    ),
                  ).marginOnly(bottom: 20, top: 200).center(),
                  Image.asset(
                    "assets/images/login.png",
                    width: 200,
                  ).marginOnly(bottom: 20).center(),
                  ElevatedButton(
                    onPressed: () => Get.toNamed('/signin'),
                    child: Text("Sign In"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      primary: Colors.greenAccent.shade700,
                    ),
                  ).Size(width: 250).marginOnly(bottom: 20).center(),
                  ElevatedButton(
                    onPressed: () => Get.toNamed('/signup'),
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      primary: Colors.greenAccent.shade700,
                    ),
                  ).Size(width: 250).center(),
                ],
              ),
            )
          : Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/login.png",
                        width: 200,
                      ).marginOnly(left: 30),
                      Text(
                        controller.signedinUser!.user ?? "",
                        style: GoogleFonts.abel(fontSize: 60),
                      ).marginOnly(top: 100, left: 20),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          controller
                              .getFollowingUsersCount(controller.signedinUser!)
                              .toString(),
                          style: GoogleFonts.abel(fontSize: 50),
                        ),
                      ).marginOnly(right: 70),
                      Obx(
                            () => Text(
                          controller
                              .getFollowersUsersCount(controller.signedinUser!)
                              .toString(),
                          style: GoogleFonts.abel(fontSize: 50),
                        ),
                      ),
                    ],
                  ).marginOnly(top: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("following", style: GoogleFonts.abel(fontSize: 30))
                          .marginOnly(right: 70),
                      Text("followers", style: GoogleFonts.abel(fontSize: 30)),
                    ],
                  ).marginOnly(bottom: 30),
                  if(controller.getFollowingUsersCount(controller.signedinUser!) != 0)
                    Obx(() {
                      if (controller.getFollowingUsersCount(controller.signedinUser!) != 0) {
                        return Text(
                          "List of following",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                          ),
                        ).marginOnly(right: 270);
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                  Obx(
                    () => Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        thickness: 10,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller
                              .getFollowingUsersCount(controller.signedinUser!),
                          itemBuilder: (context, index) {
                            final user =
                                controller.signedinUser!.followingUsers[index];
                            return ListTile(
                              subtitle: Text(
                                user.user!,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white60),
                              ).marginOnly(top: 20),
                              leading: Text(
                                '${index + 1}-',
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange.shade400,
                                ),
                              ).marginOnly(top: 20),
                              trailing: IconButton(
                                onPressed: () {
                                  controller.unfollowUser(user);
                                  controller.update();
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Colors.black,
                                ).marginOnly(top: 15),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Color(0Xff6A5495),
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ).Size(width: screen.width, height: screen.height),
      backgroundColor: Color(0Xff6A5495),
    );
  }
}
