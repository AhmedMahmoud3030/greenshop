import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/cart_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class HomeViewModel extends GetxController {
  int _navigationValue = 0;
  Widget _currentScreen = HomeView();

  get navigationValue => _navigationValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    _navigationValue = selectedValue;

    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
        }
        break;
      case 1:
        {
          _currentScreen = CartView();
        }
        break;
      case 2:
        {
          _currentScreen = ProfileView();
        }

        break;
      default:
    }

    update();
  }
}
