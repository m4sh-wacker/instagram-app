import 'package:get/get.dart';

class User {
  String? user, password, email;
  final RxList<User> followingUsers;

  User({
    this.user,
    this.password,
    this.email,
    RxList<User>? followingUsers,
  }) : this.followingUsers = followingUsers ?? RxList<User>() ;
}
