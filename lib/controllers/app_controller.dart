import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/models/user_model.dart';

class AppController extends GetxController {
  final passInCtl = TextEditingController();
  final userInCtl = TextEditingController();
  final emailInCtl = TextEditingController();

  User? signedinUser;

  final users = <User>[].obs;
  final user = Rx<User?>(null);

  final Visibility = true.obs;

  int getFollowingUsersCount(User user) {
    return user.followingUsers.length;
  }

  int getFollowersUsersCount(User user) {
    int followersCount = 0;
    for (var user in users) {
      if (user.followingUsers.contains(signedinUser)) {
        followersCount++;
      }
    }
    return followersCount;
  }




  void addfollowUser(User user) {
    if (!signedinUser!.followingUsers.contains(user)) {
      signedinUser!.followingUsers.add(user);
    } else {
      signedinUser!.followingUsers.remove(user);
    }
    update();
  }
  void unfollowUser(User user) {
      signedinUser!.followingUsers.remove(user);
    update();
  }



  void deleteAccount(User? user) {
    if (user != null) {
      users.remove(user);
      user.followingUsers.remove(signedinUser);
      update();
    }
  }



  bool signup(User user) {
    if (user.user!.isEmpty || user.password!.isEmpty || user.email!.isEmpty) {
      return false;
    }
    for (var suser in users) {
      if (user.user == suser.user) {
        return false;
      }
    }
    users.add(user);
    return true;
  }

/*
   void deleteAccount(User user) {
    users.remove(user);
  }
*/

  bool signin(User user) {
    for (var suser in users) {
      if (user.user == suser.user && user.password == suser.password) {
        signedinUser = suser;
        return true;
      }
    }
    return false;
  }



  void upuser(User user) {
    if (signedinUser != null) {
      signedinUser!.user = user.user;
      signedinUser!.email = user.email;
      signedinUser!.password = user.password;
      this.user.value = signedinUser;
    }
  }

  void upadmin(User user) {
    if (signedinUser != null) {
      signedinUser!.email = user.email;
      signedinUser!.password = user.password;
      this.user.value = signedinUser;
    }
  }

  bool search(User user) {
    for (var suser in users) {
      if (user.user == suser.user || user.user == suser.email) {
        signedinUser = suser;
        return true;
      }
    }
    return false;
  }
}
