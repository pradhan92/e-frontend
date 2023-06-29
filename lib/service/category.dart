import 'dart:convert';

import 'package:f_bussiness/model/category.dart';
import 'package:f_bussiness/util/string.dart';
import 'package:flutter/material.dart';

class CategoryService{
  static Future getCategories() async{
    try{
      var response = await AppString.client.get(Uri.parse("${AppString.baseURL}/categories"));
      if(response.statusCode==200){
        var jsonData = jsonDecode(response.body);
        return CategoryModel.fromJson(jsonData);
      }else{
        return null;
      }
    }catch(e){
          debugPrint("$e");

    }
  }
}