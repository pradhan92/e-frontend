
import 'package:f_bussiness/controller/category.dart';
import 'package:f_bussiness/controller/product.dart';
import 'package:f_bussiness/view/product.dart';
import 'package:f_bussiness/widget/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.find<CategoryController>();
    var productController = Get.find<ProductController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("E-shop"),),
      body: Obx(
        () {
        if(categoryController.isLoading .value == true){
          return const Text("Loading...");
          }else{
            return SingleChildScrollView(
             // scrollDirection: Axis.horizontal,
              child: Column(children:
               [
             SizedBox(
                width: Get.size.width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryController.categories.value.data.length,
                  itemBuilder: (BuildContext context, int index){
                    var category = categoryController.categories.value.data[index];
                    return 
                    // index == 0 ? Padding(
                    //   padding: const EdgeInsets.only(right:8.0),
                    //   child: ActionChip(
                    //     backgroundColor: Colors.green,
                    //     onPressed: () {},
                    //     label:const Text("All")),
                    // ):
                     Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: 
                      ActionChip(
                        onPressed: () {
                          productController.getProductByCategory(category.id);
                        },
                        label: Text("${category.name}"),
                        ),
                    );
                  },
                  ),
                ),
                const ListTile(
                  title: Text("Products list"),
                  subtitle: Text("List of Products provided by us"),
                ),
                GridView.builder(
                  itemCount:productController.products.value.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    ), 
                  itemBuilder: (BuildContext context, int index){
                     var product= productController.products.value.data[index];
                    // return ProductWidget(product: product);
                    return GestureDetector(
      onTap: (){
        Get.to(()=>const Productview());
      },
      child: Card(
        elevation: .2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Image.network("${product.image}",fit: BoxFit.contain,),
            ),
           const SizedBox(
              height: 5,
            ),
            Padding(padding:
            const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${product.name}",
                style:const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text("RS.${product.sellingPrice}"),
                  SizedBox(
                    height: 100,
                    child: Row(
                  children:const [
                      Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  Text("5")
     ],
                    ),
                  ),
                ])

            ]),
            )
        ]),
      ),
    );
                  })
              ]),
            );
          }
      }),
      ),
    );
  }
}


/*
 const ListTile(
                  title: Text("Products list"),
                  subtitle: Text("List of Products provided by us"),
                ),
                GridView.builder(
                  itemCount:productController.products.value.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    ), 
                  itemBuilder: (BuildContext context, int index){
                     var product= productController.products.value.data[index];
                     return ProductWidget(product: product);
                  })

                
*/


/*
return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(padding:const EdgeInsets.all(16),
              child: Column(
                children: [
                SizedBox(
                width: Get.size.width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryController.categories.value.data.length,
                  itemBuilder: (BuildContext context, int index){
                    var category = categoryController.categories.value.data[index];
                    return 
                    // index == 0 ? Padding(
                    //   padding: const EdgeInsets.only(right:8.0),
                    //   child: ActionChip(
                    //     backgroundColor: Colors.green,
                    //     onPressed: () {},
                    //     label:const Text("All")),
                    // ):
                     Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: 
                      ActionChip(
                        onPressed: () {
                          productController.getProductByCategory(category.id);
                        },
                        label: Text("${category.name}"),
                        ),
                    );
                  },
                  ),
                ),
                ],
              ),
              )
            );
*/