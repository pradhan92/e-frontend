import 'dart:convert';

import 'package:f_bussiness/model/product.dart';
import 'package:f_bussiness/util/string.dart';
import 'package:flutter/material.dart';

class ProductService{
  static Future getProductsByCategory( var id) async{
    try{
      var response = await AppString.client.get(Uri.parse("${AppString.baseURL}/categories"));
      if(response.statusCode==200){
        var jsonData = jsonDecode(response.body);
        return ProductModel.fromJson(jsonData);
      }else{
        return null;
      }
    }catch(e){
          debugPrint("$e");

    }
  }
}