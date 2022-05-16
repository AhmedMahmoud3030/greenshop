import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:greenshop/core/view_model/auth_view_model.dart';
import 'package:greenshop/view/auth/login_screen.dart';

import '../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfeild.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              Get.off(LoginScreen());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 30,
          left: 30,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Sign Up,',
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  color: primaryColor,
                  fontsize: 16,
                  header: 'Email',
                  headerColor: Colors.black,
                  hintText: 'green@shop.com',
                  onsave: (val) {
                    controller.email = val;
                  },
                  validator: (val) {
                    if (!val.toString().contains('@')) {
                      print('Shloud be valid email');
                    }
                  },
                ),
                CustomTextFormField(
                  color: primaryColor,
                  fontsize: 16,
                  header: 'Username',
                  headerColor: Colors.black,
                  hintText: 'Green',
                  onsave: (val) {
                    controller.username = val;
                  },
                  validator: (val) {
                    if (val.toString().length < 6) {
                      print('Shloud be more than 6 char username');
                    }
                  },
                ),
                CustomTextFormField(
                  color: primaryColor,
                  fontsize: 16,
                  header: 'Password',
                  headerColor: Colors.black,
                  hintText: '*********',
                  onsave: (val) {
                    controller.password = val;
                  },
                  validator: (val) {
                    if (val.toString().length < 6) {
                      print('should be more than 6 char');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onpressed: () {
                    _formKey.currentState.save();
                    controller.emailSignUpMethod();
                  },
                  color: primaryColor,
                  child: CustomText(
                    alignment: Alignment.center,
                    color: Colors.white,
                    fontSize: 16,
                    text: 'SIGN UP',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
