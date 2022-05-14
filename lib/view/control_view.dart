import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenshop/core/view_model/auth_view_model.dart';
import 'package:greenshop/view/auth/login_screen.dart';
import 'package:greenshop/view/home_view.dart';

class ControlView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Get.find<AuthViewModel>().user!=null?HomeView():LoginScreen();
      },
    );
  }
}
