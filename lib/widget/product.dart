import 'package:f_bussiness/model/product.dart';
import 'package:f_bussiness/view/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Datum product;

  @override
  Widget build(BuildContext context) {
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
  }
}
