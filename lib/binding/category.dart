import 'package:f_bussiness/controller/category.dart';
import 'package:f_bussiness/controller/product.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(ProductController());
  }
}