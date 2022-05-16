// ignore_for_file: prefer_const_constructors, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenshop/constants.dart';
import 'package:greenshop/core/view_model/control_view_model.dart';
import 'package:greenshop/core/view_model/home_view_model.dart';
import 'package:greenshop/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = [
    'Nike',
    'Puma',
    'tmo7',
    'KFC',
    'Nike',
    'Puma',
    'tmo7',
    'KFC',
    'Nike',
    'Puma',
    'tmo7',
    'KFC',
  ];

  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeViewModel>(
      builder:(controller)=> SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              child: Column(
                children: [
                  _searchTextFormField(),
                  SizedBox(
                    height: 50,
                  ),
                  CustomText(
                    text: 'Categories',
                    fontSize: 30,
                  ),
                  _listViewCategory(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Best Selling', fontSize: 20),
                        CustomText(
                          text: 'See all',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _listViewProduct(context),
                ],
              ),
            ),
          ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: Image.asset('assets/images/mens_shoe.png'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: names[index],
              )
            ],
          );
        },
        itemCount: names.length,
      ),
    );
  }

  Widget _listViewProduct(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.shade100,
                  ),
                  width: MediaQuery.of(context).size.width * .4,
                  margin: EdgeInsets.all(5),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * .4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/images/Image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'BeoPlay Speaker',
                  fontSize: 20,
                ),
                CustomText(
                  text: 'Bang and Olufsen',
                  color: Colors.grey.shade400,
                ),
                CustomText(
                  text: '\$755',
                  color: primaryColor,
                ),
              ],
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }

  
}
