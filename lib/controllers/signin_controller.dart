import 'package:flutter/material.dart';
import 'package:get/get.dart';


 class SigninPageController extends GetxController {
  final Visibility = true.obs;

/*  String username = '';
  String password = '';*/

  final userInCtl=TextEditingController();
  final passInCtl=TextEditingController();
  final emailInCtl=TextEditingController();


  final String useradmin="admin";
  final String passadmin="admin";

  showSigninErrorNotification() => Get.snackbar('signin', 'error');

 }
