class ProductModel {
  int sku;
  String name, image, description;
  Details details;

  ProductModel(
      {required this.sku,
      required this.name,
      required this.image,
      required this.description,
      required this.details});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        sku: json["SKU"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        details: Details.fromJson(json['details'] as Map<String, dynamic>));
  }

  get id => sku;
}

class Details {
  int price, quantity;

  Details({required this.price, required this.quantity});

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      price: json["price"],
      quantity: json["quantity"],
    );
  }
}
