import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfeild.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      text: 'Welcome,',
                      color: Colors.black,
                      fontSize: 50,
                    ),
                    CustomText(
                      text: 'Sign Up',
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 18,
                  color: Colors.grey,
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
                CustomText(
                  text: 'Forgot Password?',
                  alignment: Alignment.topRight,
                  fontSize: 18,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onpressed: () {
                    _formKey.currentState.save();
                    controller.emailSignInMethod();
                  },
                  color: primaryColor,
                  child: CustomText(
                    alignment: Alignment.center,
                    color: Colors.white,
                    fontSize: 16,
                    text: 'SIGN IN',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: '-OR-',
                  color: Colors.grey,
                  alignment: Alignment.center,
                  fontSize: 20,
                ),
                FlatButton.icon(
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'Sign In with Facebook',
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Sign In with Google    ',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
