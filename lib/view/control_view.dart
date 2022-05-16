import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenshop/core/view_model/auth_view_model.dart';
import 'package:greenshop/view/auth/login_screen.dart';
import 'package:greenshop/view/cart_view.dart';
import 'package:greenshop/view/home_view.dart';
import 'package:greenshop/view/profile_view.dart';

import '../core/view_model/home_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Get.find<AuthViewModel>().user == null
            ? LoginScreen()
            : Scaffold(
                bottomNavigationBar: bottomAppBar(), body: Get.find());
      },
    );
  }

  Widget bottomAppBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
          currentIndex: controller.navigationValue,
          onTap: (index) {
            controller.changeSelectedValue(index);

            
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Column(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      color: Colors.black,
                      width: 5,
                      height: 5,
                    ),
                  )
                ],
              ),
              icon: Image.asset(
                'assets/icons/explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Column(
                children: [
                  Text(
                    'Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      color: Colors.black,
                      width: 5,
                      height: 5,
                    ),
                  )
                ],
              ),
              icon: Image.asset(
                'assets/icons/cart.png',
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Column(
                children: [
                  Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      color: Colors.black,
                      width: 5,
                      height: 5,
                    ),
                  )
                ],
              ),
              icon: Image.asset(
                'assets/icons/user.png',
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              label: '',
            ),
          ]),
    );
  }
}
