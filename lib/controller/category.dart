import 'package:f_bussiness/model/category.dart';
import 'package:f_bussiness/service/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
var categories = CategoryModel(data: []).obs;
var isLoading = false.obs;

Future getCategories()async{
  try{
    isLoading(true);
    var data = await CategoryService.getCategories();
    if(data != null){
      categories.value = data;
    }
  }catch(e){
    debugPrint("$e");
  }finally{
    isLoading(false);
  }
}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }
}