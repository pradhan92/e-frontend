class ProductModel {
    ProductModel({
        required this.data,
    });

    final List<Datum> data;

    factory ProductModel.fromJson(Map<String, dynamic> json){ 
        return ProductModel(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.price,
        required this.sellingPrice,
        required this.discount,
        required this.discountAmount,
        required this.description,
        required this.category,
        required this.image,
        required this.published,
    });

    final int? id;
    final String? name;
    final int? price;
    final int? sellingPrice;
    final int? discount;
    final int? discountAmount;
    final String? description;
    final String? category;
    final String? image;
    final String? published;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            name: json["name"],
            price: json["price"],
            sellingPrice: json["selling_price"],
            discount: json["discount(%)"],
            discountAmount: json["discount_amount"],
            description: json["description"],
            category: json["category"],
            image: json["image"],
            published: json["published"],
        );
    }

}
