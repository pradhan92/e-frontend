
import 'package:f_bussiness/model/product.dart';
import 'package:f_bussiness/service/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
var products = ProductModel(data: []).obs;
var isLoading = false.obs;

Future getProductByCategory(var id)async{
  try{
    isLoading(true);
    var data = await ProductService.getProductsByCategory(id);
    if(data != null){
      products.value = data;
    }
  }catch(e){
    debugPrint("$e");
  }finally{
    isLoading(false);
  }
}
}