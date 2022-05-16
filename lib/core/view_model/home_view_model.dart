import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../../model/category_model.dart';
import '../../model/category_model.dart';
import '../../model/category_model.dart';

class HomeViewModel extends GetxController {
  
  List<CategoryModel> _categoryModel = [];
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');
  HomeViewModel() {
    getCategory();
  }
  getCategory() async {
    _categoryCollectionRef.get().then((value) => print(value.docs[0].data()));
  }
}
