import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controllers/app_controller.dart';
import 'package:instagram/pages/admin.dart';
import 'package:instagram/pages/home.dart';
import 'package:instagram/pages/manage.dart';
import 'package:instagram/pages/pages.dart';
import 'package:instagram/pages/settings.dart';
import 'package:instagram/pages/signin.dart';
import 'package:instagram/pages/signup.dart';
void main()  {
  Get.put(AppController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    title: "Instagram",
    theme: ThemeData(useMaterial3: true),
    getPages: [
      GetPage(name: "/", page: HomePage.new),
      GetPage(name: "/signin", page: SigninPage.new),
      GetPage(name: "/signup", page: SignupPage.new),
      GetPage(name: "/admin", page: AdminPage.new),
      GetPage(name: "/manage", page: ManagePage.new),
      GetPage(name: "/setings", page: SetingsPage.new),
      GetPage(name: "/pages", page: PagesPage.new),
    ],
  ));
}