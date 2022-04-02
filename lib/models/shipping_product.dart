import 'package:transportation_flutter_project/models/product.dart';

class ShippingProduct {
  Product? product;
  double? price;
  String service;

  ShippingProduct({
    required this.service,
    this.price,
    this.product,
  });

  factory ShippingProduct.fromJson(Map<String, dynamic> json) {
    return ShippingProduct(
      service: json['service'],
      price: json['price'],
      product: Product.fromJson(json['material']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'price': price,
      'material': product?.id,
    };
  }
}
